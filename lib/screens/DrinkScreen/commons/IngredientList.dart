import 'package:flutter/cupertino.dart';

import 'IngredientItem.dart';

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
                      ingredient: (index < ingredients.length) ? ingredients[index] : "",
                      measure: (index < measures.length) ? measures[index] : ""
                  ));
            }));
  }
}