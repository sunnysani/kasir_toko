// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tokkoo_pos_lite/frontend/features/outlet/screens/management/outlet/outlet_management_screen.dart';
import 'package:tokkoo_pos_lite/frontend/features/outlet/screens/management/payment_method/outlet_payment_method_management_screen.dart';
import 'package:tokkoo_pos_lite/frontend/features/outlet/screens/management/product/outlet_product_management.dart';
import 'package:tokkoo_pos_lite/frontend/features/pos/providers/pos_state.dart';
import 'package:tokkoo_pos_lite/frontend/features/pos/widgets/pos_bottom_sheet.dart';
import 'package:tokkoo_pos_lite/frontend/features/pos/widgets/pos_categorized_product_list_view.dart';
import 'package:tokkoo_pos_lite/frontend/features/pos/widgets/pos_filter_drawer.dart';
import 'package:tokkoo_pos_lite/frontend/features/pos/widgets/pos_product_list_view.dart';
import 'package:tokkoo_pos_lite/frontend/features/pos/widgets/pos_template.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/shared/search_bar.dart';
import 'package:tokkoo_pos_lite/utils/common/constant.common.dart';
import 'package:tokkoo_pos_lite/utils/common/function.common.dart';

class PosAppScreen extends ConsumerWidget {
  const PosAppScreen({super.key});

  static const routeName = '/pos/app';

  void initialUseablePosCheck(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!(await CommonFunction.outletValidationConfigured())) {
        if (context.mounted) {
          Navigator.of(context).pop();
          context.push(OutletManagementScreen.routeName);
        }
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Silakan Atur Informasi Toko terlebih dahulu'),
            backgroundColor: AppColors.negativeColor,
          ),
        );

        return;
      }

      if (!(await CommonFunction.outletValidationAtLeastOneProduct())) {
        if (context.mounted) {
          context.replace(OutletProductManagementScreen.routeName);
        }
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Silakan Tambah Minimal 1 Produk Aktif'),
            backgroundColor: AppColors.negativeColor,
          ),
        );

        return;
      }

      if (!(await CommonFunction.outletValidationAtLeastOnePaymentMethod())) {
        if (context.mounted) {
          context.replace(OutletPaymentMethodManagementScreen.routeName);
        }
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Silakan Tambah Minimal 1 Metode Pembayaran Aktif'),
            backgroundColor: AppColors.negativeColor,
          ),
        );
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    initialUseablePosCheck(context);

    final posInformationState = ref.watch(posInformationStateProvider);
    final posQuantityState = ref.watch(posQuantityStateProvider);
    final posFilterState = ref.watch(posFilterStateProvider);

    if (posInformationState.isLoading || posQuantityState.isLoading) {
      return PosTemplate(child: Center(child: CircularProgressIndicator()));
    }

    return PosTemplate(
      title: 'Kasir',
      bottomSheetWidget: PosBottomSheet(),
      endDrawer: posInformationState.value!.categoryList.isEmpty
          ? null
          : PosFilterDrawer(),
      child: Column(
        children: [
          CustomSearchBar(
            onChanged:
                ref.read(posFilterStateProvider.notifier).setSearchString,
            hintText: 'Temukan dengan Nama atau Kode',
          ),
          const SizedBox(height: 20),
          if (posFilterState.searchString.isEmpty)
            PosCaregorizedProductsListView()
          else
            PosProductListView(
                products: posInformationState.value!.allProducts
                    .where((element) =>
                        element.product.name.toLowerCase().contains(
                            posFilterState.searchString.toLowerCase()) ||
                        element.product.code.toLowerCase().contains(
                            posFilterState.searchString.toLowerCase()))
                    .toList())
        ],
      ),
    );
  }
}
