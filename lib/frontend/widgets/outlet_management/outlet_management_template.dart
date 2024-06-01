import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kasir_toko/backend/models/payment_method.dart';
import 'package:kasir_toko/backend/models/product.dart';
import 'package:kasir_toko/backend/models/product_category.dart';
import 'package:kasir_toko/frontend/widgets/common/search_bar.dart';
import 'package:kasir_toko/frontend/widgets/outlet_management/outlet_management_tile_template.dart';
import 'package:kasir_toko/utils/common/function.common.dart';

enum DataPassedType {
  productCategory,
  product,
  paymentMethod,
  error,
}

class OutletManagementTemplate extends StatefulWidget {
  const OutletManagementTemplate({
    super.key,
    required this.loadData,
    required this.showSubtitle,
    required this.creationRoute,
    required this.appBarTitle,
    required this.searchBarText,
    required this.dataList,
  });

  final String appBarTitle;
  final String creationRoute;
  final VoidCallback loadData;
  final String searchBarText;
  final bool showSubtitle;
  final List<dynamic> dataList;

  @override
  State<OutletManagementTemplate> createState() =>
      _OutletManagementTemplateState();
}

class _OutletManagementTemplateState extends State<OutletManagementTemplate> {
  DataPassedType dataPassedType = DataPassedType.error;
  String filterText = '';
  String title = '';
  String description = '';

  @override
  void initState() {
    if (widget.dataList is List<ProductCategory>) {
      dataPassedType = DataPassedType.productCategory;
    } else if (widget.dataList is List<Product>) {
      dataPassedType = DataPassedType.product;
    } else if (widget.dataList is List<PaymentMethod>) {
      dataPassedType = DataPassedType.paymentMethod;
    } else {
      dataPassedType = DataPassedType.error;
    }

    super.initState();
  }

  String? getTitleSubtitle(dynamic element) {
    if (widget.showSubtitle == false) return null;

    switch (dataPassedType) {
      case DataPassedType.product:
        return 'Harga: ${NumberFormat.currency(symbol: 'Rp ', decimalDigits: 0).format(element.getLatestRevision().price)}';
      default:
        return null;
    }
  }

  bool showBasedOnFilterString(dynamic element) {
    switch (dataPassedType) {
      case DataPassedType.productCategory:
      case DataPassedType.paymentMethod:
        return (element.name as String)
            .toLowerCase()
            .contains(filterText.toLowerCase());
      case DataPassedType.product:
        return (element.name as String)
                .toLowerCase()
                .contains(filterText.toLowerCase()) ||
            ((element.code ?? '') as String)
                .toLowerCase()
                .contains(filterText.toLowerCase());
      default:
        return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appBarTitle),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .pushNamed(widget.creationRoute)
            .then((_) => widget.loadData()),
        child: const Icon(Icons.add),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: CommonFunction.getHorizontalPaddingForMaxWidth(
            maxWidth: 550,
            context: context,
          ),
        ),
        children: [
          const SizedBox(height: 20),
          CustomSearchBar(
            onChanged: (val) => setState(() => filterText = val),
            hintText: widget.searchBarText,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.dataList.length,
            itemBuilder: (context, index) {
              if (showBasedOnFilterString(widget.dataList[index])) {
                return OutletManagementTileTemplate(
                  onTap: () => Navigator.of(context)
                      .pushNamed(widget.creationRoute,
                          arguments: widget.dataList[index])
                      .then((_) => widget.loadData()),
                  title: widget.dataList[index].name,
                  active: widget.dataList[index].active,
                  subtitle: getTitleSubtitle(widget.dataList[index]),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
