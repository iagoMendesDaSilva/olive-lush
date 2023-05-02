import 'package:flutter/material.dart';
import 'package:olive_lush/utils/colors.dart' as AppColors;

class ItemCategoryInfo extends StatelessWidget {
  final String label;
  final IconData icon;

  const ItemCategoryInfo({
    super.key,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(icon, size: 20, color: AppColors.background),
      Text(
        label,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
          color: AppColors.background,
        ),
      ),
    ]);
  }
}