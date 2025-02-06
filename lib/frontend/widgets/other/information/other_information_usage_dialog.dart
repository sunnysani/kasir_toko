import 'package:flutter/material.dart';
import 'package:kasir_toko/frontend/screens/outlet_management_screens/outlet_management_screen.dart';
import 'package:kasir_toko/frontend/screens/outlet_management_screens/outlet_payment_method_management_screen.dart';
import 'package:kasir_toko/frontend/screens/outlet_management_screens/outlet_product_category_management_screen.dart';
import 'package:kasir_toko/frontend/screens/outlet_management_screens/outlet_product_management.dart';
import 'package:kasir_toko/frontend/screens/pos_screens/pos_main_screen.dart';
import 'package:kasir_toko/frontend/widgets/common/carousel_with_dot_navigator.dart';

class OtherInformationUsageDialogItemBottomAction {
  final String label;
  final VoidCallback onTap;

  OtherInformationUsageDialogItemBottomAction({
    required this.label,
    required this.onTap,
  });
}

class OtherInformationUsageDialogItem {
  final Widget header;
  final String title;
  final Widget? titleTrailing;
  final Widget description;
  final OtherInformationUsageDialogItemBottomAction? bottomAction;

  OtherInformationUsageDialogItem({
    required this.header,
    required this.title,
    this.titleTrailing,
    required this.description,
    this.bottomAction,
  });
}

class OtherInformationUsageDialog extends StatelessWidget {
  const OtherInformationUsageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 20),
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Panduan Penggunaan Aplikasi',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Divider(),
              ],
            ),
          ),
          const SizedBox(height: 8),
          CarouselWithDotNavigator(
              height: 380,
              items: [
                OtherInformationUsageDialogItem(
                  header: Image.asset("assets/images/tutorial-1.jpeg"),
                  title: "1. Atur Informasi Toko",
                  description: const Text(
                      'Atur nama, alamat, dan no. telfon toko untuk informasi di struk'),
                  bottomAction: OtherInformationUsageDialogItemBottomAction(
                    label: 'Atur Toko',
                    onTap: () => Navigator.of(context)
                        .pushNamed(OutletManagementScreen.routeName),
                  ),
                ),
                OtherInformationUsageDialogItem(
                  header: Image.asset("assets/images/tutorial-2.jpeg"),
                  title: "2. Tambahkan Kategori Produk",
                  description: const Text(
                      'Atur Kategori Produk untuk memudahkan penyaringan produk'),
                  bottomAction: OtherInformationUsageDialogItemBottomAction(
                    label: 'Atur Kategori Produk',
                    onTap: () => Navigator.of(context).pushNamed(
                        OutletProductCategoryManagementScreen.routeName),
                  ),
                ),
                OtherInformationUsageDialogItem(
                  header: Image.asset("assets/images/tutorial-3.jpeg"),
                  title: "3. Tambahkan Produk",
                  description:
                      const Text('Atur Produk yang dijual di dalam Toko'),
                  bottomAction: OtherInformationUsageDialogItemBottomAction(
                    label: 'Atur Produk',
                    onTap: () => Navigator.of(context)
                        .pushNamed(OutletProductManagementScreen.routeName),
                  ),
                ),
                OtherInformationUsageDialogItem(
                  header: Image.asset("assets/images/tutorial-4.jpeg"),
                  title: "4. Tambahkan Metode Pembayaran",
                  description: const Text(
                      'Atur Metode Pembayaran yang disediakan dalam transaksi toko'),
                  bottomAction: OtherInformationUsageDialogItemBottomAction(
                    label: 'Atur Metode Pembayaran',
                    onTap: () => Navigator.of(context).pushNamed(
                        OutletPaymentMethodManagementScreen.routeName),
                  ),
                ),
                OtherInformationUsageDialogItem(
                  header: Image.asset("assets/images/tutorial-5.jpeg"),
                  title: "5. Operasikan Kasir",
                  description: const Text(
                      'Operasikan Point of Sale dengan memilih produk yang pelanggan beli'),
                  bottomAction: OtherInformationUsageDialogItemBottomAction(
                    label: 'Operasikan Kasir',
                    onTap: () => Navigator.of(context)
                        .pushNamed(PosMainScreen.routeName),
                  ),
                ),
              ]
                  .map((item) => ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        children: [
                          SizedBox(height: 240, child: item.header),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  item.title,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              if (item.titleTrailing != null)
                                item.titleTrailing!,
                            ],
                          ),
                          item.description,
                          if (item.bottomAction != null)
                            TextButton(
                              onPressed: item.bottomAction!.onTap,
                              child: Text(item.bottomAction!.label),
                            )
                        ],
                      ))
                  .toList()),
        ],
      ),
    );
  }
}
