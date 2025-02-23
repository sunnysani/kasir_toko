import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tokkoo_pos_lite/frontend/features/pos/screens/pos_app_screen.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/shared/text_list.dart';
import 'package:tokkoo_pos_lite/utils/common/constant.common.dart';
import 'package:tokkoo_pos_lite/utils/common/function.common.dart';

class PosTabScreen extends StatelessWidget {
  const PosTabScreen({super.key});

  static const routeName = '/pos';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: CommonFunction.getHorizontalPaddingForMaxWidth(
              maxWidth: 550, context: context),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.done_all, size: 200, color: AppColors.mainColor),
              FutureBuilder(
                  future: Future.wait<bool>([
                    CommonFunction.outletValidationConfigured(),
                    CommonFunction.outletValidationAtLeastOneProduct(),
                    CommonFunction.outletValidationAtLeastOnePaymentMethod(),
                  ]),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Padding(
                        padding: EdgeInsets.all(16),
                        child: LinearProgressIndicator(),
                      );
                    }

                    final outletConfigured = snapshot.data![0];
                    final atLeastOneProduct = snapshot.data![0];
                    final atLeastOnePaymentMehtod = snapshot.data![0];

                    if (outletConfigured &&
                        atLeastOneProduct &&
                        atLeastOnePaymentMehtod) {
                      return Text(
                        'Konfigurasi Toko sudah lengkap',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      );
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sebelum kamu mengoperasikan kasir pastikan:',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        TextList(
                          texts: [
                            'Pastikan konfigurasi toko Anda telah benar',
                            'Pastikan produk-produk di toko Anda sudah diaftarkan'
                          ],
                          type: TextListType.number,
                        ),
                      ],
                    );
                  }),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () => context.push(PosAppScreen.routeName),
                  child: const Text('Masuk ke Halaman Kasir'))
            ],
          ),
        ),
      ),
    );
  }
}
