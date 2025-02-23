import 'package:app_settings/app_settings.dart' as app_settings_lib;
import 'package:flutter/material.dart';
import 'package:flutter_esc_pos_utils/flutter_esc_pos_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tokkoo_pos_lite/backend/db/instance.db.dart';
import 'package:tokkoo_pos_lite/backend/models/drift_entity_order_row.dart';
import 'package:tokkoo_pos_lite/backend/models/useable/drift_usable_order_row.dart';
import 'package:tokkoo_pos_lite/utils/common/constant.common.dart';
import 'package:tokkoo_pos_lite/utils/start_configs/app_settings.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';

final escPrinterProvider =
    NotifierProvider<EscPrinterNotifier, EscPrinter>(EscPrinterNotifier.new);

class EscPrinter {
  final List<BluetoothInfo> availableDevices;
  final BluetoothInfo? selectedDevice;
  final bool printing;

  const EscPrinter({
    this.availableDevices = const [],
    this.selectedDevice,
    this.printing = false,
  });

  EscPrinter copyWith({
    List<BluetoothInfo>? availableDevices,
    BluetoothInfo? selectedDevice,
    bool? printing,
  }) {
    return EscPrinter(
      availableDevices: availableDevices ?? this.availableDevices,
      selectedDevice: selectedDevice ?? this.selectedDevice,
      printing: printing ?? this.printing,
    );
  }
}

class EscPrinterNotifier extends Notifier<EscPrinter> {
  static const PaperSize paperSize = PaperSize.mm58;

  @override
  EscPrinter build() {
    ref.keepAlive();
    tryConnectLastConnected();
    return const EscPrinter();
  }

  void tryConnectLastConnected() {
    final latestMac = AppSettings.sharedPreferences
        .getString('LATEST_CONNECTED_PRINTER_MAC_ADDRESS');
    final latestName = AppSettings.sharedPreferences
        .getString('LATEST_CONNECTED_PRINTER_NAME');
    if (latestMac != null && latestName != null) {
      selectDevice(BluetoothInfo(name: latestName, macAdress: latestMac));
    }
  }

  Future<bool> selectDevice(BluetoothInfo device) async {
    if (state.selectedDevice != null) {
      await PrintBluetoothThermal.disconnect;
    }

    final connected = await PrintBluetoothThermal.connect(
        macPrinterAddress: device.macAdress);
    if (connected) {
      await AppSettings.sharedPreferences
          .setString('LATEST_CONNECTED_PRINTER_MAC_ADDRESS', device.macAdress);
      await AppSettings.sharedPreferences
          .setString('LATEST_CONNECTED_PRINTER_NAME', device.name);
      state = state.copyWith(selectedDevice: device);
      return true;
    }
    return false;
  }

  Future<bool> isBluetoothEnabled() async {
    if (!(await Permission.bluetoothScan.isGranted) ||
        !(await Permission.bluetoothConnect.isGranted)) {
      final scanPermission = await Permission.bluetoothScan.request();
      final connectPermission = await Permission.bluetoothConnect.request();

      if (scanPermission.isPermanentlyDenied ||
          connectPermission.isPermanentlyDenied) {
        app_settings_lib.AppSettings.openAppSettings();
        return false;
      }

      if (scanPermission != PermissionStatus.granted ||
          connectPermission != PermissionStatus.granted) {
        return false;
      }
    }

    if (!(await PrintBluetoothThermal.bluetoothEnabled)) {
      return false;
    }

    return true;
  }

  Future<List<BluetoothInfo>?> getDevices() async {
    if (!await isBluetoothEnabled()) {
      return null;
    }

    return await PrintBluetoothThermal.pairedBluetooths;
  }

  bool initialCheckPrintPass(BuildContext context) {
    if (state.selectedDevice == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Tidak ada printer terpilih'),
        backgroundColor: AppColors.negativeColor,
      ));
      return false;
    }

    if (state.printing) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Sedang melakukan print'),
        backgroundColor: AppColors.negativeColor,
      ));
      return false;
    }

    return true;
  }

  Future<void> printTesting(BuildContext context) async {
    if (!initialCheckPrintPass(context)) return;

    state = state.copyWith(printing: true);

    final profile = await CapabilityProfile.load();
    final ticket = Generator(paperSize, profile);
    List<int> bytes = [];

    bytes += ticket.text('Tokkoo PoS',
        styles: const PosStyles(
          align: PosAlign.center,
          height: PosTextSize.size1,
          width: PosTextSize.size1,
          fontType: PosFontType.fontB,
        ),
        linesAfter: 1);

    bytes += ticket.text(
        'Waktu: ${DateFormat('d MMM yyyy HH:mm:ss').format(DateTime.now())}',
        styles: const PosStyles(
          align: PosAlign.center,
          height: PosTextSize.size1,
          width: PosTextSize.size1,
          fontType: PosFontType.fontB,
        ),
        linesAfter: 1);

    bytes += ticket.text('Tes mencetak berhasil',
        styles: const PosStyles(
          align: PosAlign.center,
          height: PosTextSize.size1,
          width: PosTextSize.size1,
          fontType: PosFontType.fontB,
        ),
        linesAfter: 1);

    bytes += ticket.cut();
    bytes += ticket.drawer();

    await PrintBluetoothThermal.writeBytes(bytes);
    await Future.delayed(const Duration(milliseconds: 2000));

    state = state.copyWith(printing: false);
  }

  Future<void> printOrder(
    BuildContext context,
    DriftUsableOrderRow orderRow,
  ) async {
    if (!initialCheckPrintPass(context)) return;

    state = state.copyWith(printing: true);
    await PrintBluetoothThermal.writeBytes(
        await getPrintOrderRowBytes(orderRow));
    await Future.delayed(const Duration(milliseconds: 2000));
    state = state.copyWith(printing: false);
  }

  Future<void> printEJournal(
    BuildContext context,
    DateTime startDate,
    DateTime endDate,
    TimeOfDay start,
    TimeOfDay end,
  ) async {
    if (!initialCheckPrintPass(context)) return;

    state = state.copyWith(printing: true);

    List<DriftUsableOrderRow> orderList = await InstanceDB.getOrderRowList(
      startDateTime: DateTime(startDate.year, startDate.month, startDate.day,
          start.hour, start.minute, 0),
      endDateTime: DateTime(endDate.year, endDate.month, endDate.day, end.hour,
          end.minute, 59, 59),
    );

    await PrintBluetoothThermal.writeBytes(
      await getPrintEJournalBytes(orderList,
          "${DateFormat("d MM yyyy").format(startDate)} @ ${start.format(context)} - ${DateFormat("d MM yyyy").format(endDate)} @ ${end.format(context)}"),
    );

    await Future.delayed(const Duration(milliseconds: 2000));
    state = state.copyWith(printing: false);
  }

  Future<void> printProudctSales(
    BuildContext context,
    DateTime startDate,
    DateTime endDate,
    TimeOfDay start,
    TimeOfDay end,
  ) async {
    if (!initialCheckPrintPass(context)) return;

    state = state.copyWith(printing: true);

    List<DriftUsableOrderRow> orderList = await InstanceDB.getOrderRowList(
      startDateTime: DateTime(startDate.year, startDate.month, startDate.day,
          start.hour, start.minute, 0),
      endDateTime: DateTime(endDate.year, endDate.month, endDate.day, end.hour,
          end.minute, 59, 59),
      status: OrderStatus.paid,
    );

    await PrintBluetoothThermal.writeBytes(
      await getPrintProductSalesBytes(orderList,
          "${DateFormat("d MM yyyy").format(startDate)} @ ${start.format(context)} - ${DateFormat("d MM yyyy").format(endDate)} @ ${end.format(context)}"),
    );

    await Future.delayed(const Duration(milliseconds: 2000));
    state = state.copyWith(printing: false);
  }

  Future<List<int>> getPrintOrderRowBytes(DriftUsableOrderRow orderRow) async {
    final profile = await CapabilityProfile.load();

    final Generator ticket = Generator(paperSize, profile);
    List<int> bytes = [];

    // Print Outlet Name
    bytes += ticket.text(
      InstanceDB.outlet.name,
      styles: const PosStyles(
        align: PosAlign.center,
        height: PosTextSize.size2,
        width: PosTextSize.size2,
        fontType: PosFontType.fontB,
      ),
      linesAfter: 1,
    );

    // Print Outlet Address and PhoneNumber
    bytes += ticket.text(
      InstanceDB.outlet.address,
      styles: const PosStyles(
        fontType: PosFontType.fontA,
        align: PosAlign.center,
      ),
      linesAfter: 0,
    );
    bytes += ticket.text(
      'No. Telp: ${InstanceDB.outlet.phoneNumber}',
      styles: const PosStyles(
        fontType: PosFontType.fontA,
        align: PosAlign.center,
      ),
      linesAfter: 1,
    );

    // Print Date
    bytes += ticket.hr(ch: '-');
    bytes += ticket.text(
      DateFormat('d MMM yyyy HH:mm:ss')
          .format(orderRow.orderData.updatedAt.toLocal()),
      styles: const PosStyles(
        align: PosAlign.center,
        fontType: PosFontType.fontA,
      ),
    );
    bytes += ticket.hr(ch: '-', linesAfter: 1);

    for (final orderRowItem in orderRow.items) {
      bytes += ticket.row([
        PosColumn(
          text: orderRowItem.product.product.nameInReceipt.isNotEmpty
              ? orderRowItem.product.product.nameInReceipt
              : orderRowItem.product.product.name,
          width: 12,
          styles: const PosStyles(
              bold: false, fontType: PosFontType.fontA, align: PosAlign.left),
        ),
      ]);

      bytes += ticket.row([
        PosColumn(
          text: '${orderRowItem.itemData.quantity.toString()}pcs',
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
              .format(orderRowItem.product.latestRevision.price),
          width: 4,
          styles: const PosStyles(bold: false, align: PosAlign.left),
        ),
        PosColumn(
          text: '=',
          width: 1,
          styles: const PosStyles(bold: false, align: PosAlign.left),
        ),
        PosColumn(
          text: NumberFormat.currency(symbol: 'Rp ', decimalDigits: 0).format(
              orderRowItem.product.latestRevision.price *
                  orderRowItem.itemData.quantity),
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
            .format(orderRow.orderData.totalPrice),
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
        text: orderRow.paymentMethod!.name,
        width: 6,
        styles: const PosStyles(
            bold: false, align: PosAlign.right, fontType: PosFontType.fontA),
      ),
    ]);

    // Print PayAmount & Change
    if (orderRow.paymentMethod?.sameAsAmount == false) {
      bytes += ticket.row([
        PosColumn(
          text: 'Pembayaran',
          width: 6,
          styles: const PosStyles(bold: false, fontType: PosFontType.fontA),
        ),
        PosColumn(
          text: NumberFormat.currency(symbol: 'Rp ', decimalDigits: 0)
              .format(orderRow.orderData.payAmount),
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
          text: NumberFormat.currency(symbol: 'Rp ', decimalDigits: 0).format(
              orderRow.orderData.payAmount - orderRow.orderData.totalPrice),
          width: 6,
          styles: const PosStyles(
              bold: false, align: PosAlign.right, fontType: PosFontType.fontA),
        ),
      ]);
    }

    bytes += ticket.hr(ch: '-', linesAfter: 1);

    bytes += ticket.text(
      InstanceDB.outlet.receiptMessage.isNotEmpty
          ? InstanceDB.outlet.receiptMessage
          : 'Terima kasih sudah datang',
      styles:
          const PosStyles(align: PosAlign.center, fontType: PosFontType.fontA),
      linesAfter: 2,
    );

    bytes += ticket.feed(2);
    bytes += ticket.drawer();
    return bytes;
  }

  Future<List<int>> getPrintEJournalBytes(
      List<DriftUsableOrderRow> orderList, String dateString) async {
    final profile = await CapabilityProfile.load();

    final Generator ticket = Generator(paperSize, profile);
    List<int> bytes = [];

    bytes += ticket.text(
      "Journal",
      styles: const PosStyles(
        align: PosAlign.center,
        fontType: PosFontType.fontA,
        width: PosTextSize.size2,
        height: PosTextSize.size2,
      ),
    );

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

    // key: paymentMethod.name
    // value: total
    Map<String, double> totalIncomeMapping = {};
    double totalIncome = 0;

    for (DriftUsableOrderRow orderRow in orderList) {
      if (orderRow.paymentMethod != null) {
        if (totalIncomeMapping[orderRow.paymentMethod!.name] == null) {
          totalIncomeMapping[orderRow.paymentMethod!.name] = 0;
        }
        totalIncomeMapping[orderRow.paymentMethod!.name] =
            totalIncomeMapping[orderRow.paymentMethod!.name]! +
                orderRow.orderData.totalPrice;
        totalIncome += orderRow.orderData.totalPrice;
      }

      bytes += ticket.row([
        PosColumn(
          text: DateFormat("d MMMM yyyy @ HH:mm")
              .format(orderRow.orderData.createdAt.toLocal()),
          width: 12,
          styles: const PosStyles(
              bold: false, fontType: PosFontType.fontA, align: PosAlign.left),
        ),
      ]);
      for (final orderRowItem in orderRow.items) {
        bytes += ticket.row([
          PosColumn(
            text: orderRowItem.product.product.name,
            width: 12,
            styles: const PosStyles(
                bold: false, fontType: PosFontType.fontA, align: PosAlign.left),
          ),
        ]);

        bytes += ticket.row([
          PosColumn(
            text: '${orderRowItem.itemData.quantity.toString()}pcs',
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
                .format(orderRowItem.product.latestRevision.price),
            width: 4,
            styles: const PosStyles(bold: false, align: PosAlign.left),
          ),
          PosColumn(
            text: '=',
            width: 1,
            styles: const PosStyles(bold: false, align: PosAlign.left),
          ),
          PosColumn(
            text: NumberFormat.currency(symbol: 'Rp ', decimalDigits: 0).format(
                orderRowItem.itemData.quantity *
                    orderRowItem.product.latestRevision.price),
            width: 4,
            styles: const PosStyles(
                bold: false,
                align: PosAlign.center,
                fontType: PosFontType.fontA),
          ),
        ]);
      }

      if (orderRow.paymentMethod != null) {
        bytes += ticket.row([
          PosColumn(
            text: orderRow.paymentMethod!.name,
            width: 6,
            styles: const PosStyles(bold: true, fontType: PosFontType.fontA),
          ),
          PosColumn(
            text: NumberFormat.currency(symbol: 'Rp ', decimalDigits: 0)
                .format(orderRow.orderData.totalPrice),
            width: 6,
            styles: const PosStyles(
                bold: false,
                align: PosAlign.right,
                fontType: PosFontType.fontA),
          ),
        ]);
      } else {
        bytes += ticket.row([
          PosColumn(
            // TODO: Text Based on Status
            text: "DIBATALKAN",
            width: 12,
            styles: const PosStyles(bold: true, fontType: PosFontType.fontA),
          ),
        ]);
      }

      bytes += ticket.hr(ch: '-');
    }

    bytes += ticket.row([
      PosColumn(
        text: "LAPORAN PENDAPATAN",
        width: 12,
        styles: const PosStyles(bold: true, fontType: PosFontType.fontA),
      )
    ]);
    for (final entry in totalIncomeMapping.entries) {
      bytes += ticket.row([
        PosColumn(
          text: entry.key,
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
    bytes += ticket.row([
      PosColumn(
        text: "TOTAL",
        width: 6,
        styles: const PosStyles(bold: true, fontType: PosFontType.fontA),
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

  Future<List<int>> getPrintProductSalesBytes(
      List<DriftUsableOrderRow> orderList, String dateString) async {
    final profile = await CapabilityProfile.load();

    final Generator ticket = Generator(paperSize, profile);
    List<int> bytes = [];

    bytes += ticket.text(
      "Penjualan Produk",
      styles: const PosStyles(
        align: PosAlign.center,
        fontType: PosFontType.fontA,
        width: PosTextSize.size2,
        height: PosTextSize.size2,
      ),
    );

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

    for (final orderRow in orderList) {
      totalIncome += orderRow.orderData.totalPrice;
      for (final orderRowItem in orderRow.items) {
        if (itemQtyMapping[orderRowItem.product.latestRevision.id] == null) {
          itemQtyMapping[orderRowItem.product.latestRevision.id] = 0;
        }

        itemQtyMapping[orderRowItem.product.latestRevision.id] =
            itemQtyMapping[orderRowItem.product.latestRevision.id]! +
                orderRowItem.itemData.quantity;
      }
    }

    // Sort the entries by value in descending order
    var sortedEntries = itemQtyMapping.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    // Iterate over the sorted entries
    for (var entry in sortedEntries) {
      final productRevision =
          await InstanceDB.getProductRevisionByID(id: entry.key);
      final product =
          await InstanceDB.getProductByID(id: productRevision.product);

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
