import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:olive_lush/models/Drink.dart';
import 'package:olive_lush/models/Ingredient.dart';
import 'package:olive_lush/screens/CollectionScreen/CollectionViewModel.dart';

import '../../di.dart';
import 'commons/Header.dart';
import '../../commons/Load.dart';
import '../../commons/ListDrinks.dart';
import '../../models/DrinkByIngredient.dart';

class CollectionScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CollectionScreenState();
}

class CollectionScreenState extends State<CollectionScreen> {
  Ingredient? ingredient;
  List<Drink> drinks = [];
  var loading = true;
  late CollectionViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = getIt<CollectionViewModel>();
    _viewModel.getIngredients().then((drinks) {
      setState(() {
        if (drinks.isNotEmpty)
          ingredient = drinks[Random().nextInt(drinks.length)];
      });
      if (ingredient != null)
        _geDrinksByIngredient();
      else
        loading = false;
    });
  }

  void _geDrinksByIngredient() async {
    List<DrinkByIngredient> drinkIds =
        await _viewModel.getByIngredients(ingredient!.ingredient);
    for (var drinkId in drinkIds.take(4)) {
      List<Drink> drinkList = await _viewModel.getDrinkById(drinkId.id);
      if (drinkList.isNotEmpty) {
        setState(() {
          drinks.addAll(drinkList);
        });
      }
      loading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Header(ingredient: ingredient),
      Expanded(
          child:
              loading ? Load() : ListDrinks(drinks: drinks, useLargeItem: true))
    ]);
  }
}
