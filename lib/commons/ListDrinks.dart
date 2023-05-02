import 'package:flutter/cupertino.dart';

import 'DrinkItem.dart';
import 'DrinkItemLarge.dart';
import '../models/Drink.dart';

class ListDrinks extends StatelessWidget {
  final List<Drink> drinks;
  final bool useLargeItem;

  const ListDrinks(
      {super.key, required this.drinks, this.useLargeItem = false});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
            itemCount: drinks.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(top: 7.0, bottom: 7.0),
                child: useLargeItem
                    ? DrinkItemLarge(
                        name: drinks[index].name,
                        description: drinks[index].instructions,
                        alcoholic: drinks[index].alcoholic,
                        img: drinks[index].drinkThumb,
                      )
                    : DrinkItem(
                        name: drinks[index].name,
                        description: drinks[index].instructions,
                        alcoholic: drinks[index].alcoholic,
                        img: drinks[index].drinkThumb,
                      ),
              );
            }));
  }
}
