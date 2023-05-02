import 'package:flutter/material.dart';
import 'package:olive_lush/utils/strings.dart' as StringResource;

import 'BackArrow.dart';
import 'HeaderInfo.dart';
import 'CategoryInfo.dart';
import 'IngredientList.dart';
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
              BackArrow(),
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