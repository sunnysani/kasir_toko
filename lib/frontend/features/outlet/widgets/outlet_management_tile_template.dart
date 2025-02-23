import 'package:flutter/material.dart';
import 'package:tokkoo_pos_lite/utils/common/constant.common.dart';

class OutletManagementTileTemplate extends StatelessWidget {
  const OutletManagementTileTemplate(
      {super.key,
      required this.onTap,
      required this.title,
      this.subtitle,
      required this.active});

  final VoidCallback onTap;
  final String title;
  final String? subtitle;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ]),
            child: ListTile(
              tileColor: Colors.white,
              title: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: subtitle != null ? Text(subtitle!) : null,
              trailing: Text(
                active ? 'Aktif' : 'Nonaktif',
                style: TextStyle(
                  color: active
                      ? AppColors.positiveColor
                      : AppColors.negativeColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
