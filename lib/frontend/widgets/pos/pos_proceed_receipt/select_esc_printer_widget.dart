import 'package:flutter/material.dart';
import 'package:kasir_toko/backend/provider/esc_printer.dart';
import 'package:provider/provider.dart';

class SelectEscPrinterWidget extends StatelessWidget {
  const SelectEscPrinterWidget(this.context, {super.key});

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Pilih Printer'),
          actions: [
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.close),
            )
          ],
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: Provider.of<EscPrinter>(context).availableDevices.length,
          itemBuilder: (BuildContext context, int index) => InkWell(
            onTap: () {
              Provider.of<EscPrinter>(context, listen: false).selectedDevice =
                  Provider.of<EscPrinter>(context, listen: false)
                      .availableDevices[index];
              Navigator.of(context).pop();
            },
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              title: Text(Provider.of<EscPrinter>(context)
                  .availableDevices[index]
                  .name),
              subtitle: Text(Provider.of<EscPrinter>(context)
                  .availableDevices[index]
                  .macAdress),
            ),
          ),
        ),
        // floatingActionButton: StreamBuilder<bool>(
        //   stream:
        //       Provider.of<EscPrinter>(context).printerManager.,
        //   initialData: false,
        //   builder: (c, snapshot) {
        //     // if (snapshot.data!) {
        //     //   return FloatingActionButton(
        //     //     backgroundColor: AppColors.mainColor,
        //     //     onPressed: Provider.of<EscPrinter>(context, listen: false)
        //     //         .stopScanDevices,
        //     //     child: const Icon(Icons.stop),
        //     //   );
        //     // } else {
        //       return FloatingActionButton(
        //         backgroundColor: AppColors.mainColor,
        //         onPressed: Provider.of<EscPrinter>(context, listen: false)
        //             .startScanDevices,
        //         child: const Icon(Icons.search),
        //       );
        //     // }
        //   },
        // ),
      ),
    );
  }
}
