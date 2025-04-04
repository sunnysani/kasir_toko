import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
import 'package:tokkoo_pos_lite/backend/provider/esc_printer.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/shared/select_esc_printer_widget.dart';
import 'package:tokkoo_pos_lite/gen/strings.g.dart';
import 'package:tokkoo_pos_lite/utils/common/constant.common.dart';

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
      PrintBluetoothThermal.batteryLevel.then((value) {
        setState(() => batteryLevel = value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final escState = ref.watch(escPrinterProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(t.esc_strings.printer_status),
        Flexible(
          child: TextButton(
            onPressed: () async {
              if (!await ref
                  .read(escPrinterProvider.notifier)
                  .isBluetoothEnabled()) {
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(t.esc_strings.bluetooth_turned_off),
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
              "${escState.selectedDevice?.name ?? t.esc_strings.not_connected}${batteryLevel == null || escState.selectedDevice == null ? "" : " - $batteryLevel%"} (${escState.printing ? t.esc_strings.printing : t.esc_strings.idle})",
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
