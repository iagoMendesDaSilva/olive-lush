import 'package:flutter/material.dart';
import 'package:olive_lush/models/Alcoholic.dart';
import 'package:olive_lush/models/GlassType.dart';
import 'package:olive_lush/utils/colors.dart' as AppColors;
import 'package:olive_lush/utils/strings.dart' as StringResource;

import '../../../models/Drink.dart';

class DrinkItemInfo extends StatelessWidget {
  final Drink drink;

  const DrinkItemInfo({super.key, required this.drink});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                child: Image.network(
                  drink.drinkThumb,
                  fit: BoxFit.cover,
                  errorBuilder: (c, o, s) =>
                      Image.asset('assets/placeholder.jpg'),
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Container(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                ),
              ),
              BackButton(),
            ],
          )),
      Expanded(
          child: SingleChildScrollView(
              child: Container(
        margin: EdgeInsets.only(top: 20, left: 25, right: 25),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          HeaderInfo(name: drink.name, description: drink.instructions),
          CategoryInfo(
              alcoholic: drink.alcoholic,
              category: drink.category,
              glass: drink.glass),
          Text(
            StringResource.strings['ingredients']!,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 10),
          IngredientList(
              ingredients: drink.ingredients, measures: drink.measures),
        ]),
      )))
    ]);
  }
}

class IngredientList extends StatelessWidget {
  final List<String> ingredients;
  final List<String> measures;

  const IngredientList(
      {super.key, required this.ingredients, required this.measures});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: ingredients.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: EdgeInsets.only(top: 7.0, bottom: 7.0),
                  child: IngredientItem(
                      index: index + 1,
                      ingredient: ingredients[index],
                      measure: measures[index]));
            }));
  }
}

class IngredientItem extends StatelessWidget {
  final int index;
  final String ingredient;
  final String measure;

  const IngredientItem(
      {super.key,
      required this.index,
      required this.ingredient,
      required this.measure});

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Theme.of(context).colorScheme.primary),
        ),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Text(
            index.toString(),
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ),
      SizedBox(width: 10),
      Text(
        ingredient,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      SizedBox(width: 8),
      Text(
        measure,
        style: Theme.of(context).textTheme.bodySmall,
      )
    ]);
  }
}

class BackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: EdgeInsets.only(top: 36, left: 16),
          child: Container(
              alignment: Alignment.center,
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Theme.of(context).colorScheme.surface,
              ),
              child: Center(child: Icon(Icons.keyboard_arrow_left, size: 30),)),
        ));
  }
}

class HeaderInfo extends StatelessWidget {
  final String name;
  final String description;

  const HeaderInfo({super.key, required this.name, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium)),
        Text(
          description,
          style: Theme.of(context).textTheme.bodySmall,
        )
      ],
    );
  }
}

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
