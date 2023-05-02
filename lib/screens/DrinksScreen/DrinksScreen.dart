import 'dart:async';
import 'package:flutter/material.dart';
import 'package:olive_lush/commons/commons.dart';
import 'package:olive_lush/utils/strings.dart' as StringResource;
import 'package:olive_lush/screens/DrinksScreen/DrinksViewModel.dart';

import '../../di.dart';
import 'commons/Search.dart';
import 'commons/DrinkItem.dart';
import '../../models/Drink.dart';

class DrinksScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DrinksScreenState();
}

class DrinksScreenState extends State<DrinksScreen> {
  List<Drink> drinks = [];
  var loading = true;
  var searchText = '';
  Timer? _debounce;
  late DrinksViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = getIt<DrinksViewModel>();
    _viewModel.getDrinks().then((data) {
      setState(() {
        drinks = data;
        loading = false;
      });
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchTextChanged(String text) {
    setState(() {
      searchText = text;
    });

    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      _getDrinks();
    });
  }

  void _getDrinks() async {
    if (searchText.isEmpty) {
      _viewModel.getDrinks().then((data) {
        setState(() {
          drinks = data;
        });
      });
    } else {
      _viewModel.searchDrinks(searchText).then((data) {
        setState(() {
          drinks = data;
        });
      });
    }
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
