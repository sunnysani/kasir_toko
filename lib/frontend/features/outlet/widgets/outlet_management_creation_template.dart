import 'package:flutter/material.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/shared/layouts/layout_max_width.dart';

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
      body: SafeArea(
        child: Center(
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  child: LayoutMaxWidth(
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
              LayoutMaxWidth(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 50,
                    margin: const EdgeInsets.only(bottom: 20),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        submit();
                      },
                      child: Text(isCreation ? 'Tambah' : 'Simpan'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
