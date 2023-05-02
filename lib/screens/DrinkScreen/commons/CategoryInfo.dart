import 'package:flutter/material.dart';
import 'package:olive_lush/utils/colors.dart' as AppColors;

import 'ItemCategoryInfo.dart';
import '../../../models/Alcoholic.dart';
import '../../../models/GlassType.dart';

class CategoryInfo extends StatelessWidget {
  final Alcoholic alcoholic;
  final String category;
  final GlassType glass;

  const CategoryInfo(
      {super.key,
        required this.alcoholic,
        required this.category,
        required this.glass});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Container(
            height: 60,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 12),
            color: Theme.of(context).colorScheme.primary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ItemCategoryInfo(label: alcoholic.label, icon: alcoholic.icon),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: VerticalDivider(
                      thickness: 1,
                      color: AppColors.background,
                    )),
                ItemCategoryInfo(label: category, icon: Icons.category),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: VerticalDivider(
                      thickness: 1,
                      color: AppColors.background,
                    )),
                ItemCategoryInfo(label: glass.label, icon: Icons.wine_bar),
              ],
            ),
          ),
        ));
  }
}