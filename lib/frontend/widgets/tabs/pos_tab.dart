import 'package:flutter/material.dart';
import 'package:kasir_toko/frontend/screens/pos_screens/pos_main_screen.dart';
import 'package:kasir_toko/utils/common/constant.common.dart';
import 'package:kasir_toko/utils/common/function.common.dart';
import 'package:kasir_toko/utils/start_configs/static_db.dart';

class PosTab extends StatelessWidget {
  const PosTab({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Make below component reusable as in report_tab
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
              if (StaticDB.outlet.isGeneralInformationOk &&
                  StaticDB.outlet.hasAtLeastOneProduct &&
                  StaticDB.outlet.hasAtLeastOnePaymentMethod)
                const Text(
                  'Konfigurasi Toko sudah lengkap',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                )
              else
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sebelum kamu mengoperasikan kasir pastikan:',
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Text(' 1. Pastikan konfigurasi toko Anda telah benar',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 18)),
                    Text(
                        ' 2. Pastikan produk-produk di toko Anda sudah diaftarkan',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 18)),
                  ],
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed(PosMainScreen.routeName),
                  child: const Text('Masuk ke Halaman Kasir'))
            ],
          ),
        ),
      ),
    );
  }
}
