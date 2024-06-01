import 'package:flutter/material.dart';
import 'package:kasir_toko/utils/common/constant.common.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar(
      {super.key, required this.onChanged, required this.hintText});

  final void Function(String) onChanged;
  final String hintText;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController searchTextController = TextEditingController();
  final FocusNode searchTextFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(searchTextFocusNode),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.mainColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.search,
              color: AppColors.mainColor,
              size: 20,
            ),
            const SizedBox(width: 10),
            Flexible(
              child: TextField(
                focusNode: searchTextFocusNode,
                controller: searchTextController,
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    isDense: true,
                    hintText: widget.hintText,
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    )),
                onChanged: widget.onChanged,
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
