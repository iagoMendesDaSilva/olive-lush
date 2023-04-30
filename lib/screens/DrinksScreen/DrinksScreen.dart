import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:olive_lush/commons/commons.dart';
import 'package:olive_lush/utils/strings.dart' as StringResource;

import '../../utils/drinkFormat.dart';
import 'commons/DrinkItem.dart';
import '../../services/api.dart';
import '../../models/GlassType.dart';

class DrinksScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DrinksScreenState();
}

class DrinksScreenState extends State<DrinksScreen> {
  var drinks = [];
  var loading = true;

  void getDrinks() async {
    try {
      final Dio dio = GetIt.instance<Dio>();
      var response = await dio.get(SEARCH_URL);
      if (response.statusCode == 200) {
        setState(() {
          drinks = response.data['drinks'] as List;
        });
      }
    } catch (w) {
      print(w);
    }
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getDrinks();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Header(text: StringResource.strings['header_drinks']),
      Expanded(
          child: loading
              ? Load()
              : drinks.isEmpty
                  ? EmptyList()
                  : ListDrinks(drinks: drinks))
    ]);
  }
}

class ListDrinks extends StatelessWidget {
  final List drinks;

  const ListDrinks({super.key, required this.drinks});

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
                  child: DrinkItem(
                    name: drinks[index]['strDrink'],
                    description: drinks[index]['strInstructions'],
                    alcoholic: DrinkFormat.getAlcoholic(drinks[index]['strAlcoholic']),
                    img: drinks[index]['strDrinkThumb'],
                  ));
            }));
  }
}
