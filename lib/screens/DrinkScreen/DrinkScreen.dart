import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:olive_lush/models/Drink.dart';
import 'package:olive_lush/screens/DrinkScreen/DrinkViewModel.dart';
import 'package:olive_lush/screens/DrinkScreen/commons/DrinkItemInfo.dart';

import '../../di.dart';
import '../../commons/Load.dart';
import '../../commons/EmptyList.dart';

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
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    _viewModel = getIt<DrinkViewModel>();
    _viewModel.getDrinkById(widget.id).then((drinks) {
      setState(() {
        if (drinks.isNotEmpty) drink = drinks[0];
      });
      loading = false;
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
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
