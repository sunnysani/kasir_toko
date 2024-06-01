import 'package:flutter/material.dart';
import 'package:kasir_toko/utils/common/function.common.dart';

class OutletManagementCreationTemplate extends StatelessWidget {
  const OutletManagementCreationTemplate({
    super.key,
    required this.title,
    required this.submit,
    required this.child,
    this.isCreation = true,
  });

  final String title;
  final VoidCallback submit;
  final Widget child;
  final bool isCreation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: CommonFunction.getHorizontalPaddingForMaxWidth(
                        maxWidth: 550, context: context),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      child,
                      const SizedBox(height: 90)
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: CommonFunction.getHorizontalPaddingForMaxWidth(
                      maxWidth: 550, context: context),
                ),
                child: Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: submit,
                    child: Text(isCreation ? 'Tambah' : 'Simpan'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
