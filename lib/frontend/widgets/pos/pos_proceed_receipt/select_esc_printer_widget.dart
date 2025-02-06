import 'package:flutter/material.dart';
import 'package:tokkoo_pos_lite/backend/provider/esc_printer.dart';
import 'package:tokkoo_pos_lite/utils/common/constant.common.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
import 'package:provider/provider.dart';

class SelectEscPrinterWidget extends StatelessWidget {
  const SelectEscPrinterWidget(this.context, {super.key});

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(
          vertical: 16,
        ),
        children: [
          const Text(
            'Perangkat yang Dikenali',
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
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.data == null) return const SizedBox();

                  return Scrollbar(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final item = snapshot.data![index];

                        return ListTile(
                          onTap: () async {
                            final connected = await Provider.of<EscPrinter>(
                                    context,
                                    listen: false)
                                .selectDevice(item);

                            if (connected == false) {
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('Gagal menghubungkan perangkat'),
                                  backgroundColor: AppColors.negativeColor,
                                ),
                              );
                            }

                            if (context.mounted && connected) {
                              Navigator.of(context).pop();
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
        ],
      ),
    );
  }
}
