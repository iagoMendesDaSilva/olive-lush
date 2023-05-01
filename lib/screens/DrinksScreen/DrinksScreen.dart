import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:olive_lush/commons/commons.dart';
import 'package:olive_lush/utils/strings.dart' as StringResource;

import '../../models/Drink.dart';
import '../../services/api.dart';
import 'commons/DrinkItem.dart';
import 'commons/Search.dart';

class DrinksScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DrinksScreenState();
}

class DrinksScreenState extends State<DrinksScreen> {
  List<Drink> drinks = [];
  var loading = true;
  var searchText = '';
  Timer? _debounce;

  void _onSearchTextChanged(String text) {
    setState(() {
      searchText = text;
    });
    _debounce?.cancel();
    _debounce = Timer(Duration(seconds: 1), () {
      if (searchText.isEmpty)
        getDrinks();
      else
        searchDrinks();
    });
  }

  void getDrinks() async {
    try {
      final Dio dio = GetIt.instance<Dio>();
      var response = await dio.get(INITIAL_SEARCH_URL);
      if (response.statusCode == 200) {
        final List<dynamic> drinksJson = response.data['drinks'];
        final List<Drink> drinksConverted =
            drinksJson.map((drinkJson) => Drink.fromJson(drinkJson)).toList();
        setState(() {
          drinks = drinksConverted;
        });
      }
    } catch (w) {
      print(w);
    }
    setState(() {
      loading = false;
    });
  }

  void searchDrinks() async {
    try {
      final Dio dio = GetIt.instance<Dio>();
      var response = await dio.get(SEARCH_URL + searchText);
      if (response.statusCode == 200) {
        print(response.data);
        final List<dynamic> drinksJson = response.data['drinks'];
        final List<Drink> drinksConverted =
            drinksJson.map((drinkJson) => Drink.fromJson(drinkJson)).toList();
        setState(() {
          drinks = drinksConverted;
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
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Header(text: StringResource.strings['header_drinks']),
      Search(onSearchTextChanged: _onSearchTextChanged),
      SizedBox(height: 20.0),
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
  final List<Drink> drinks;

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
                    name: drinks[index].name,
                    description: drinks[index].instructions,
                    alcoholic: drinks[index].alcoholic,
                    img: drinks[index].drinkThumb,
                  ));
            }));
  }
}