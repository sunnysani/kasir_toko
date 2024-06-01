import 'package:flutter/material.dart';
import 'package:kasir_toko/utils/common/constant.common.dart';

class OutletManagementTab extends StatelessWidget {
  const OutletManagementTab(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.navigatorRoute,
      required this.refreshData});
  final String title;
  final String subtitle;
  final String navigatorRoute;
  final VoidCallback refreshData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(navigatorRoute)
          .then((_) => refreshData()),
      child: Container(
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
            style: const TextStyle(
              color: AppColors.mainColor,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.05,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(
                color: AppColors.accentColor,
                fontSize: 14,
                letterSpacing: 1.05),
          ),
          trailing: const Icon(
            Icons.chevron_right_outlined,
            size: 36,
            color: AppColors.mainColor,
          ),
        ),
      ),
    );
  }
}
