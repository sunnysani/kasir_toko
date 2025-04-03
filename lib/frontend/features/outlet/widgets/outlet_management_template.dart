import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:tokkoo_pos_lite/frontend/features/outlet/widgets/outlet_management_tile_template.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/shared/layouts/layout_max_width.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/shared/search_bar.dart';

enum DataPassedType {
  productCategory,
  product,
  paymentMethod,
}

class OutletManagementTemplate extends StatefulWidget {
  const OutletManagementTemplate({
    super.key,
    required this.creationRoute,
    required this.appBarTitle,
    required this.searchBarText,
    required this.isLoading,
    this.dataList,
    required this.dataPassedType,
  });

  final String appBarTitle;
  final String creationRoute;
  final String searchBarText;
  final bool isLoading;
  final List<dynamic>? dataList;
  final DataPassedType dataPassedType;

  @override
  State<OutletManagementTemplate> createState() =>
      _OutletManagementTemplateState();
}

class _OutletManagementTemplateState extends State<OutletManagementTemplate> {
  String filterText = '';
  String title = '';
  String description = '';

  String getTitle(dynamic element) {
    switch (widget.dataPassedType) {
      case DataPassedType.product:
        return element.product.name;
      default:
        return element.name;
    }
  }

  bool getActive(dynamic element) {
    switch (widget.dataPassedType) {
      case DataPassedType.product:
        return element.product.active;
      default:
        return element.active;
    }
  }

  String? getTitleSubtitle(dynamic element) {
    switch (widget.dataPassedType) {
      case DataPassedType.product:
        return 'Harga: ${NumberFormat.currency(symbol: 'Rp ', decimalDigits: 0).format(element.latestRevision.price)}';
      default:
        return null;
    }
  }

  bool showBasedOnFilterString(dynamic element) {
    switch (widget.dataPassedType) {
      case DataPassedType.productCategory:
      case DataPassedType.paymentMethod:
        return (element.name as String)
            .toLowerCase()
            .contains(filterText.toLowerCase());
      case DataPassedType.product:
        return (element.product.name as String)
                .toLowerCase()
                .contains(filterText.toLowerCase()) ||
            ((element.product.code ?? '') as String)
                .toLowerCase()
                .contains(filterText.toLowerCase());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appBarTitle),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(widget.creationRoute),
        child: const Icon(Icons.add),
      ),
      body: LayoutMaxWidth(
        child: ListView(
          children: [
            const SizedBox(height: 20),
            CustomSearchBar(
              onChanged: (val) => setState(() => filterText = val),
              hintText: widget.searchBarText,
            ),
            if (widget.isLoading)
              Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Center(child: CircularProgressIndicator())),
            if (!widget.isLoading && widget.dataList != null)
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.dataList!.length,
                itemBuilder: (context, index) {
                  if (showBasedOnFilterString(widget.dataList![index])) {
                    return OutletManagementTileTemplate(
                      onTap: () => context.push(widget.creationRoute,
                          extra: widget.dataList![index]),
                      title: getTitle(widget.dataList![index]),
                      active: getActive(widget.dataList![index]),
                      subtitle: getTitleSubtitle(widget.dataList![index]),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
