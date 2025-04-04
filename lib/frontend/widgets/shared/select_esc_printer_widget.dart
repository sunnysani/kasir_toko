import 'package:app_settings/app_settings.dart' as app_settings_lib;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tokkoo_pos_lite/backend/provider/esc_printer.dart';
import 'package:tokkoo_pos_lite/gen/strings.g.dart';
import 'package:tokkoo_pos_lite/utils/common/constant.common.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';

class SelectEscPrinterWidget extends ConsumerWidget {
  const SelectEscPrinterWidget(this.context, {super.key});

  final BuildContext context;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: AppSize.maxWidth),
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
            vertical: 16,
          ),
          children: [
            Text(
              t.esc_strings.paired_devices,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 450,
              child: FutureBuilder(
                  future: PrintBluetoothThermal.pairedBluetooths,
                  builder: (ftrBuilderContext, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.data == null) return const SizedBox();

                    return Scrollbar(
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (listViewContext, index) {
                          final item = snapshot.data![index];

                          return ListTile(
                            onTap: () async {
                              final connected = await ref
                                  .read(escPrinterProvider.notifier)
                                  .selectDevice(item);

                              if (connected == false) {
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(listViewContext)
                                    .showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        t.esc_strings.failed_to_connect_device),
                                    backgroundColor: AppColors.negativeColor,
                                  ),
                                );
                              }

                              if (context.mounted && connected) {
                                context.pop();
                              }
                            },
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 4),
                            title: Text(item.name),
                            subtitle: Text(item.macAdress),
                          );
                        },
                      ),
                    );
                  }),
            ),
            const SizedBox(height: 16),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: TextButton(
                  onPressed: () => app_settings_lib.AppSettings.openAppSettings(
                      type: app_settings_lib.AppSettingsType.bluetooth),
                  child: Text(t.esc_strings.cannot_find_device)),
            ),
          ],
        ),
      ),
    );
  }
}
