import 'package:flutter/material.dart';
import 'package:olive_lush/models/Drink.dart';
import 'package:olive_lush/screens/DrinkScreen/DrinkViewModel.dart';
import 'package:olive_lush/screens/DrinkScreen/commons/DrinkItemInfo.dart';

import '../../commons/EmptyList.dart';
import '../../commons/Load.dart';
import '../../di.dart';

class DrinkScreen extends StatefulWidget {
  final String id;

  const DrinkScreen({super.key, required this.id});

  @override
  State<StatefulWidget> createState() => DrinkScreenState();
}

class DrinkScreenState extends State<DrinkScreen> {
  Drink? drink;
  var loading = true;
  late DrinkViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = getIt<DrinkViewModel>();
    _viewModel.getDrinkById(widget.id).then((drinks) {
      setState(() {
        if (drinks.isNotEmpty) drink = drinks[0];
      });
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Expanded(
          child: loading
              ? Load()
              : drink == null
                  ? EmptyList()
                  : DrinkItemInfo(drink: drink!))
    ]));
  }
}
