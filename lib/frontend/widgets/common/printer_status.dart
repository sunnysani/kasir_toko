import 'package:flutter/material.dart';
import 'package:kasir_toko/backend/provider/esc_printer.dart';
import 'package:kasir_toko/utils/common/function.common.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
import 'package:provider/provider.dart';

class PrinterStatus extends StatefulWidget {
  const PrinterStatus({super.key});

  @override
  State<PrinterStatus> createState() => _PrinterStatusState();
}

class _PrinterStatusState extends State<PrinterStatus> {
  int? batteryLevel;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<EscPrinter>(context, listen: false).tryConnectLastConnected();
      setState(
          () async => batteryLevel = await PrintBluetoothThermal.batteryLevel);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Status printer:'),
        Flexible(
          child: TextButton(
            onPressed: () => CommonFunction.showEscPrinterConnectModal(context),
            child: Text(
              "${Provider.of<EscPrinter>(context).selectedDevice?.name ?? 'Tidak Terhubung'}${batteryLevel == null || Provider.of<EscPrinter>(context).selectedDevice == null ? "" : " - $batteryLevel%"} (${Provider.of<EscPrinter>(context).printing ? 'Mencetak' : 'Diam'})",
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              softWrap: true,
            ),
          ),
        )
      ],
    );
  }
}
