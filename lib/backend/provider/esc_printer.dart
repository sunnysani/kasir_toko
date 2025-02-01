// String sel = select as String;
// if (sel == "permission bluetooth granted") {
//   bool status = await PrintBluetoothThermal.isPermissionBluetoothGranted;
//   setState(() {
//     _info = "permission bluetooth granted: $status";
//   });
//   //open setting permision if not granted permision
// } else if (sel == "bluetooth enabled") {
//   bool state = await PrintBluetoothThermal.bluetoothEnabled;
//   setState(() {
//     _info = "Bluetooth enabled: $state";
//   });
// } else if (sel == "update info") {
//   initPlatformState();
// } else if (sel == "connection status") {
//   final bool result = await PrintBluetoothThermal.connectionStatus;
//   connected = result;
//   setState(() {
//     _info = "connection status: $result";
//   });
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_esc_pos_utils/flutter_esc_pos_utils.dart';
import 'package:intl/intl.dart';
import 'package:kasir_toko/backend/models/order_row.dart';
import 'package:kasir_toko/backend/models/order_row_item.dart';
import 'package:kasir_toko/backend/models/payment_method.dart';
import 'package:kasir_toko/utils/common/constant.common.dart';
import 'package:kasir_toko/utils/start_configs/static_db.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';

class EscPrinter with ChangeNotifier {
  static final PrintBluetoothThermal _printerManager = PrintBluetoothThermal();
  static List<BluetoothInfo> _availableDevices = [];
  static BluetoothInfo? _selectedDevice;
  bool printing = false;
  // TODO: Make this dynamic data
  static PaperSize paperSize = PaperSize.mm58;

  List<BluetoothInfo> get availableDevices {
    return _availableDevices;
  }

  BluetoothInfo? get selectedDevice {
    return _selectedDevice;
  }

  set selectedDevice(BluetoothInfo? device) {
    _selectedDevice = device;
    if (device != null) {
      PrintBluetoothThermal.connect(macPrinterAddress: device.macAdress);
      notifyListeners();
    }
  }

  PrintBluetoothThermal get printerManager {
    return _printerManager;
  }

  Future<void> startScanDevices() async {
    if (!(await Permission.bluetoothScan.isGranted) ||
        !(await Permission.bluetoothConnect.isGranted)) {
      final scanPermission = await Permission.bluetoothScan.request();
      final connectPermssion = await Permission.bluetoothScan.request();
      if (scanPermission != PermissionStatus.granted ||
          connectPermssion != PermissionStatus.granted) {
        return;
      }
    }

    if (!(await Permission.bluetoothConnect.isGranted)) {
      final permisisonRequest = await Permission.bluetoothConnect.request();
      if (permisisonRequest != PermissionStatus.granted) {
        return;
      }
    }

    _availableDevices = await PrintBluetoothThermal.pairedBluetooths;

    notifyListeners();

    // // TODO: Check if device scan is allowed
    // _availableDevices = [];

    // printerManager.startScan(const Duration(seconds: 4));
    // notifyListeners();

    // printerManager.scanResults.listen((event) async {
    //   _availableDevices = event;
    //   notifyListeners();
    // });
  }

  // void stopScanDevices() {
  //   printerManager.stopScan();
  // }

  bool initialCheckPrintPass(BuildContext context) {
    if (_selectedDevice == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Tidak ada printer terpilih'),
          backgroundColor: AppColors.negativeColor,
        ),
      );
      return false;
    }

    if (printing) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Sedang melakukan print'),
          backgroundColor: AppColors.negativeColor,
        ),
      );
      return false;
    }

    return true;
  }

  Future<void> printOrder(
    BuildContext context,
    OrderRow orderRow,
  ) async {
    if (!initialCheckPrintPass(context)) return;

    printing = true;
    notifyListeners();
    await PrintBluetoothThermal.writeBytes(
        await getPrintOrderRowBytes(orderRow));
    await Future.delayed(const Duration(milliseconds: 2000));
    printing = false;
    notifyListeners();
  }

  Future<void> printEJournal(
    BuildContext context,
    DateTime date,
    TimeOfDay start,
    TimeOfDay end,
  ) async {
    if (!initialCheckPrintPass(context)) return;

    List<OrderRow> orderList =
        StaticDB.outlet.getOrderRowListBetweenTime(date, start, end);

    printing = true;
    notifyListeners();
    await PrintBluetoothThermal.writeBytes(
      await getPrintEJournalBytes(orderList,
          "${DateFormat("d MMMM yyyy").format(date)} @ ${start.format(context)} - ${end.format(context)}"),
    );
    await Future.delayed(const Duration(milliseconds: 2000));
    printing = false;
    notifyListeners();
  }

  Future<void> printProudctSales(
    BuildContext context,
    DateTime date,
    TimeOfDay start,
    TimeOfDay end,
  ) async {
    if (!initialCheckPrintPass(context)) return;

    List<OrderRow> orderList =
        StaticDB.outlet.getOrderRowListBetweenTime(date, start, end);

    printing = true;
    notifyListeners();
    await PrintBluetoothThermal.writeBytes(
      await getPrintProductSalesBytes(orderList,
          "${DateFormat("d MMMM yyyy").format(date)} @ ${start.format(context)} - ${end.format(context)}"),
    );
    await Future.delayed(const Duration(milliseconds: 2000));
    printing = false;
    notifyListeners();
  }

  Future<List<int>> getPrintOrderRowBytes(OrderRow orderRow) async {
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
        text: 'Metode',
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

  Future<List<int>> getPrintEJournalBytes(
      List<OrderRow> orderList, String dateString) async {
    final profile = await CapabilityProfile.load();

    final Generator ticket = Generator(paperSize, profile);
    List<int> bytes = [];

    // Print Date
    bytes += ticket.hr(ch: '-');
    bytes += ticket.text(
      dateString,
      styles: const PosStyles(
        align: PosAlign.center,
        fontType: PosFontType.fontA,
      ),
    );
    bytes += ticket.hr(ch: '-', linesAfter: 1);

    // key: paymentMethod.TargetId
    // value: total
    Map<int, double> totalIncomeMapping = {};

    for (OrderRow orderRow in orderList) {
      if (totalIncomeMapping[orderRow.paymentMethod.targetId] == null) {
        totalIncomeMapping[orderRow.paymentMethod.targetId] = 0;
      }

      totalIncomeMapping[orderRow.paymentMethod.targetId] =
          totalIncomeMapping[orderRow.paymentMethod.targetId]! +
              orderRow.totalPrice;

      bytes += ticket.row([
        PosColumn(
          text: DateFormat("d MMMM yyyy @ HH:mm").format(orderRow.timeStamp),
          width: 12,
          styles: const PosStyles(
              bold: false, fontType: PosFontType.fontA, align: PosAlign.left),
        ),
      ]);
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
                bold: false,
                align: PosAlign.center,
                fontType: PosFontType.fontA),
          ),
        ]);
      }

      bytes += ticket.row([
        PosColumn(
          text: orderRow.paymentMethod.target!.name,
          width: 6,
          styles: const PosStyles(bold: true, fontType: PosFontType.fontA),
        ),
        PosColumn(
          text: NumberFormat.currency(symbol: 'Rp ', decimalDigits: 0)
              .format(orderRow.totalPrice),
          width: 6,
          styles: const PosStyles(
              bold: false, align: PosAlign.right, fontType: PosFontType.fontA),
        ),
      ]);

      bytes += ticket.hr(ch: '-');
    }

    bytes += ticket.row([
      PosColumn(
        text: "TOTAL PENDAPATAN",
        width: 12,
        styles: const PosStyles(bold: true, fontType: PosFontType.fontA),
      )
    ]);
    for (final entry in totalIncomeMapping.entries) {
      bytes += ticket.row([
        PosColumn(
          text: StaticDB.paymentMethodBox.get(entry.key)!.name,
          width: 6,
          styles: const PosStyles(bold: true, fontType: PosFontType.fontA),
        ),
        PosColumn(
          text: NumberFormat.currency(symbol: 'Rp ', decimalDigits: 0)
              .format(entry.value),
          width: 6,
          styles: const PosStyles(
              bold: false, align: PosAlign.right, fontType: PosFontType.fontA),
        ),
      ]);
    }

    ticket.feed(2);
    ticket.cut();
    return bytes;
  }

  Future<List<int>> getPrintProductSalesBytes(
      List<OrderRow> orderList, String dateString) async {
    final profile = await CapabilityProfile.load();

    final Generator ticket = Generator(paperSize, profile);
    List<int> bytes = [];

    // Print Date
    bytes += ticket.hr(ch: '-');
    bytes += ticket.text(
      dateString,
      styles: const PosStyles(
        align: PosAlign.center,
        fontType: PosFontType.fontA,
      ),
    );
    bytes += ticket.hr(ch: '-', linesAfter: 1);

    // key: productRevision.TargetId
    // value: qty
    Map<int, int> itemQtyMapping = {};

    double totalIncome = 0;

    for (OrderRow orderRow in orderList) {
      totalIncome += orderRow.totalPrice;
      for (OrderRowItem orderRowItem in orderRow.orderRowItem) {
        if (itemQtyMapping[orderRowItem.productRevision.targetId] == null) {
          itemQtyMapping[orderRowItem.productRevision.targetId] = 0;
        }

        itemQtyMapping[orderRowItem.productRevision.targetId] =
            itemQtyMapping[orderRowItem.productRevision.targetId]! +
                orderRowItem.quantity;
      }
    }

// Sort the entries by value in descending order
    var sortedEntries = itemQtyMapping.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    // Iterate over the sorted entries
    for (var entry in sortedEntries) {
      final productRevision = StaticDB.productRevisionBox.get(entry.key)!;
      final product = productRevision.product.target!;

      bytes += ticket.row([
        PosColumn(
          text: product.name,
          width: 8,
          styles: const PosStyles(bold: true, fontType: PosFontType.fontA),
        ),
        PosColumn(
          text: "${entry.value} qty",
          width: 4,
          styles: const PosStyles(
              bold: false, align: PosAlign.right, fontType: PosFontType.fontA),
        ),
      ]);
      bytes += ticket.row([
        PosColumn(
          text: NumberFormat.currency(symbol: 'Rp ', decimalDigits: 0)
              .format(productRevision.price * entry.value),
          width: 12,
          styles: const PosStyles(bold: false, fontType: PosFontType.fontA),
        ),
      ]);

      ticket.feed(1);
    }

    bytes += ticket.row([
      PosColumn(
        text: "Pendapatan",
        width: 6,
        styles: const PosStyles(bold: false, fontType: PosFontType.fontA),
      ),
      PosColumn(
        text: NumberFormat.currency(symbol: 'Rp ', decimalDigits: 0)
            .format(totalIncome),
        width: 6,
        styles: const PosStyles(
            bold: false, align: PosAlign.right, fontType: PosFontType.fontA),
      ),
    ]);

    bytes += ticket.feed(2);
    return bytes;
  }
}
