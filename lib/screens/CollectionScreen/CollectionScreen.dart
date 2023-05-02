import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:olive_lush/models/Ingredient.dart';
import 'package:olive_lush/screens/CollectionScreen/CollectionViewModel.dart';

import '../../di.dart';
import 'commons/Header.dart';

class CollectionScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CollectionScreenState();
}

class CollectionScreenState extends State<CollectionScreen> {
  Ingredient? ingredient;
  var loading = true;
  late CollectionViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = getIt<CollectionViewModel>();
    _viewModel.getIngredients().then((drinks) {
      setState(() {
        if (drinks.isNotEmpty) ingredient = drinks[Random().nextInt(drinks.length)];
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Header(ingredient: ingredient),
    );
  }
}
