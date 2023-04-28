import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:olive_lush/commons/commons.dart';
import 'package:olive_lush/strings.dart' as StringResource;

import 'commons/DrinkItem.dart';
import '../../models/GlassType.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DiscoverScreenState();
}

class DiscoverScreenState extends State<DiscoverScreen> {
  var drinks;

  void getDrinks() async {
    try {
      var response = await Dio().get(
          'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita');
      if (response.statusCode == 200) {
        setState(() {
          drinks = response.data['drinks'] as List;
        });
      }
    } catch (w) {
      print(w);
    }
  }

  @override
  void initState() {
    super.initState();
    getDrinks();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Header(text: StringResource.strings['header_discover']),
      Expanded(
          child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                  itemCount: drinks == null ? 0 : drinks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: EdgeInsets.only(top: 7.0, bottom: 7.0),
                        child: DrinkItem(
                          name: drinks[index]['strDrink'],
                          description: drinks[index]['strInstructions'],
                          glassType: getGlassType(drinks[index]['strGlass']),
                          ingredients:getIngredients(drinks[index]),
                          img: drinks[index]['strDrinkThumb'],
                        ));
                  })))
    ]);
  }

  getGlassType(glassType) {
    return (glassType == "Cocktail glass")
        ? GlassType(StringResource.strings['glass_cocktail']!, Icons.local_bar)
        : GlassType(StringResource.strings['glass_champagne']!, Icons.wine_bar);
  }

  getIngredients(drink) {
    List<String> ingredients = [];

    drink.forEach((key, value) {
      if (key.startsWith('strIngredient') && value != null)
        ingredients.add(value);
    });

    return ingredients;
  }

}
