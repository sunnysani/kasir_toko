import 'package:esc_pos_bluetooth/esc_pos_bluetooth.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kasir_toko/backend/models/order_row.dart';
import 'package:kasir_toko/backend/models/order_row_item.dart';
import 'package:kasir_toko/utils/common/constant.common.dart';
import 'package:kasir_toko/utils/start_configs/static_db.dart';

class EscPrinter with ChangeNotifier {
  static final PrinterBluetoothManager _printerManager =
      PrinterBluetoothManager();
  static List<PrinterBluetooth> _availableDevices = [];
  static PrinterBluetooth? _selectedDevice;
  bool printing = false;
  // TODO: Make this dynamic data
  static PaperSize paperSize = PaperSize.mm58;

  List<PrinterBluetooth> get availableDevices {
    return _availableDevices;
  }

  PrinterBluetooth? get selectedDevice {
    return _selectedDevice;
  }

  set selectedDevice(PrinterBluetooth? device) {
    _selectedDevice = device;
    notifyListeners();
  }

  PrinterBluetoothManager get printerManager {
    return _printerManager;
  }

  Future<void> startScanDevices() async {
    // TODO: Check if device scan is allowed
    _availableDevices = [];

    printerManager.startScan(const Duration(seconds: 4));
    notifyListeners();

    printerManager.scanResults.listen((event) async {
      _availableDevices = event;
      notifyListeners();
    });
  }

  void stopScanDevices() {
    printerManager.stopScan();
  }

  Future<void> printOrder(
    BuildContext context,
    OrderRow orderRow,
  ) async {
    if (_selectedDevice == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Tidak ada printer terpilih'),
          backgroundColor: AppColors.negativeColor,
        ),
      );
      return;
    }

    if (printing) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Sedang melakukan print'),
          backgroundColor: AppColors.negativeColor,
        ),
      );
      return;
    }

    _printerManager.selectPrinter(_selectedDevice!);
    printing = true;
    notifyListeners();
    await printerManager.printTicket(await getPrintBytes(orderRow));
    await Future.delayed(const Duration(milliseconds: 2000));
    printing = false;
    notifyListeners();
  }

  Future<List<int>> getPrintBytes(OrderRow orderRow) async {
    final profile = await CapabilityProfile.load();

    final Generator ticket = Generator(paperSize, profile);
    List<int> bytes = [];

    // Print Outlet Name
    bytes += ticket.text(
      StaticDB.outlet.name ?? 'Toko',
      styles: const PosStyles(
        align: PosAlign.center,
        height: PosTextSize.size2,
        width: PosTextSize.size2,
        fontType: PosFontType.fontB,
      ),
      linesAfter: 1,
    );

    // Print Outlet Address and PhoneNumber
    if (StaticDB.outlet.address != null) {
      bytes += ticket.text(
        StaticDB.outlet.address!,
        styles: const PosStyles(
          fontType: PosFontType.fontA,
          align: PosAlign.center,
        ),
        linesAfter: 0,
      );
    }
    if (StaticDB.outlet.phoneNumber != null) {
      bytes += ticket.text(
        'No. Telp: ${StaticDB.outlet.phoneNumber!}',
        styles: const PosStyles(
          fontType: PosFontType.fontA,
          align: PosAlign.center,
        ),
        linesAfter: 1,
      );
    }

    // Print Date
    bytes += ticket.hr(ch: '-');
    bytes += ticket.text(
      DateFormat('d MMM yyyy HH:mm:ss').format(orderRow.timeStamp),
      styles: const PosStyles(
        align: PosAlign.center,
        fontType: PosFontType.fontA,
      ),
    );
    bytes += ticket.hr(ch: '-', linesAfter: 1);

    for (OrderRowItem orderRowItem in orderRow.orderRowItem) {
      bytes += ticket.row([
        PosColumn(
          text: orderRowItem.product.target!.name,
          width: 12,
          styles: const PosStyles(
              bold: false, fontType: PosFontType.fontA, align: PosAlign.left),
        ),
      ]);

      bytes += ticket.row([
        PosColumn(
          text: '${orderRowItem.quantity.toString()}pcs',
          width: 2,
          styles: const PosStyles(bold: false, align: PosAlign.left),
        ),
        PosColumn(
          text: 'x',
          width: 1,
          styles: const PosStyles(bold: false, align: PosAlign.left),
        ),
        PosColumn(
          text: NumberFormat.currency(symbol: 'Rp ', decimalDigits: 0)
              .format(orderRowItem.product.target!.getLatestRevision().price),
          width: 4,
          styles: const PosStyles(bold: false, align: PosAlign.left),
        ),
        PosColumn(
          text: '=',
          width: 1,
          styles: const PosStyles(bold: false, align: PosAlign.left),
        ),
        PosColumn(
          text: NumberFormat.currency(symbol: 'Rp ', decimalDigits: 0)
              .format(orderRowItem.totalPriceItem),
          width: 4,
          styles: const PosStyles(
              bold: false, align: PosAlign.center, fontType: PosFontType.fontA),
        ),
      ]);
    }

    bytes += ticket.text('');
    bytes += ticket.hr(ch: '-');

    // Print Total
    bytes += ticket.row([
      PosColumn(
        text: 'Total',
        width: 6,
        styles: const PosStyles(bold: false, fontType: PosFontType.fontA),
      ),
      PosColumn(
        text: NumberFormat.currency(symbol: 'Rp ', decimalDigits: 0)
            .format(orderRow.totalPrice),
        width: 6,
        styles: const PosStyles(
            bold: false, align: PosAlign.right, fontType: PosFontType.fontA),
      ),
    ]);

    // Print PaymentMethod
    bytes += ticket.row([
      PosColumn(
        text: 'Metode Pembayaran',
        width: 6,
        styles: const PosStyles(bold: false, fontType: PosFontType.fontA),
      ),
      PosColumn(
        text: orderRow.paymentMethod.target!.name,
        width: 6,
        styles: const PosStyles(
            bold: false, align: PosAlign.right, fontType: PosFontType.fontA),
      ),
    ]);

    // Print PayAmount & Change
    if (orderRow.paymentMethod.target?.sameAsAmount == false) {
      bytes += ticket.row([
        PosColumn(
          text: 'Pembayaran',
          width: 6,
          styles: const PosStyles(bold: false, fontType: PosFontType.fontA),
        ),
        PosColumn(
          text: NumberFormat.currency(symbol: 'Rp ', decimalDigits: 0)
              .format(orderRow.payAmount),
          width: 6,
          styles: const PosStyles(
              bold: false, align: PosAlign.right, fontType: PosFontType.fontA),
        ),
      ]);

      bytes += ticket.row([
        PosColumn(
          text: 'Kembalian',
          width: 6,
          styles: const PosStyles(bold: false, fontType: PosFontType.fontA),
        ),
        PosColumn(
          text: NumberFormat.currency(symbol: 'Rp ', decimalDigits: 0)
              .format(orderRow.change),
          width: 6,
          styles: const PosStyles(
              bold: false, align: PosAlign.right, fontType: PosFontType.fontA),
        ),
      ]);
    }

    bytes += ticket.hr(ch: '-', linesAfter: 1);

    bytes += ticket.text(
      StaticDB.outlet.receiptMessage != null &&
              StaticDB.outlet.receiptMessage!.isNotEmpty
          ? StaticDB.outlet.receiptMessage!
          : 'Terima kasih sudah datang',
      styles:
          const PosStyles(align: PosAlign.center, fontType: PosFontType.fontA),
      linesAfter: 2,
    );

    ticket.feed(2);
    ticket.cut();
    return bytes;
  }
}
