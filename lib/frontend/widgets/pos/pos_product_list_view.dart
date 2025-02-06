import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:tokkoo_pos_lite/backend/models/product.dart';
import 'package:tokkoo_pos_lite/utils/common/constant.common.dart';

class PosProductListView extends StatelessWidget {
  const PosProductListView({
    super.key,
    this.title,
    required this.products,
    required this.productIdQuantityControllerMap,
    required this.notifyChangedQuantity,
  });

  final String? title;
  final List<Product> products;
  final Map<int, TextEditingController> productIdQuantityControllerMap;
  final VoidCallback notifyChangedQuantity;

  void onQuantityChanged(int productId, int newQuantity) {
    productIdQuantityControllerMap[productId]!.text = newQuantity as String;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (title != null)
          Text(
            title!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: products.length,
            itemBuilder: (_, index) {
              return Card(
                child: ListTile(
                  title: Text(products[index].name),
                  subtitle: Text(
                    NumberFormat.currency(symbol: 'Rp ', decimalDigits: 0)
                        .format(products[index].getLatestRevision().price),
                  ),
                  trailing: InputQuantity(
                    notifyChangedQuantity: notifyChangedQuantity,
                    textEditingController:
                        productIdQuantityControllerMap[products[index].id]!,
                  ),
                ),
              );
            }),
        const SizedBox(height: 20)
      ],
    );
  }
}

class InputQuantity extends StatefulWidget {
  const InputQuantity({
    super.key,
    required this.textEditingController,
    required this.notifyChangedQuantity,
  });

  final TextEditingController textEditingController;
  final VoidCallback notifyChangedQuantity;
  // final void onQuantityChanged(number, int) onQuantityChanged;

  inputQuantityChanged(int val) {
    if (val < 0) {
      textEditingController.text = '0';
    } else {
      textEditingController.text = val.toString();
    }

    notifyChangedQuantity();
  }

  @override
  State<InputQuantity> createState() => _InputQuantityState();
}

class _InputQuantityState extends State<InputQuantity> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          constraints: const BoxConstraints(),
          iconSize: 15,
          color: AppColors.mainColor,
          onPressed: () => widget.inputQuantityChanged(
              int.parse(widget.textEditingController.text) - 1),
          icon: const Icon(Icons.remove),
        ),
        SizedBox(
          width: 40,
          child: TextField(
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
            ),
            textAlign: TextAlign.center,
            controller: widget.textEditingController,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
            onChanged: (value) =>
                widget.inputQuantityChanged(int.tryParse(value) ?? 0),
          ),
        ),
        IconButton(
          constraints: const BoxConstraints(),
          iconSize: 15,
          color: AppColors.mainColor,
          onPressed: () => widget.inputQuantityChanged(
              int.parse(widget.textEditingController.text) + 1),
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
