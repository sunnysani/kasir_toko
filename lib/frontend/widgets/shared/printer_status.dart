import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
import 'package:provider/provider.dart';
import 'package:tokkoo_pos_lite/backend/provider/esc_printer.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/shared/select_esc_printer_widget.dart';
import 'package:tokkoo_pos_lite/utils/common/constant.common.dart';
import 'package:tokkoo_pos_lite/utils/common/function.common.dart';

class PrinterStatus extends ConsumerStatefulWidget {
  const PrinterStatus({super.key});

  @override
  ConsumerState<PrinterStatus> createState() => _PrinterStatusState();
}

class _PrinterStatusState extends ConsumerState<PrinterStatus> {
  int? batteryLevel;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(escPrinterProvider.notifier).tryConnectLastConnected();
      setState(
          () async => batteryLevel = await PrintBluetoothThermal.batteryLevel);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final escState = ref.watch(escPrinterProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Status printer:'),
        Flexible(
          child: TextButton(
            onPressed: () async {
              if (!await ref
                  .read(escPrinterProvider.notifier)
                  .isBluetoothEnabled()) {
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Bluetooth mati'),
                  backgroundColor: AppColors.negativeColor,
                ));
                return;
              }
              if (context.mounted) {
                showDialog(
                  context: context,
                  builder: (context) => SelectEscPrinterWidget(context),
                );
              }
            },
            child: Text(
              "${escState.selectedDevice?.name ?? 'Tidak Terhubung'}${batteryLevel == null || escState.selectedDevice == null ? "" : " - $batteryLevel%"} (${escState.printing ? 'Mencetak' : 'Diam'})",
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
