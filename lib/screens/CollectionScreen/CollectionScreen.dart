import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:olive_lush/models/Ingredient.dart';
import '../../services/api.dart';
import 'commons/Header.dart';

class CollectionScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CollectionScreenState();
}

class CollectionScreenState extends State<CollectionScreen> {
  Ingredient? ingredient;
  var loading = true;

  void getIngredient() async {
    try {
      final Dio dio = GetIt.instance<Dio>();
      var response = await dio.get(INGREDIENTS_URL);
      if (response.statusCode == 200) {
        final List<dynamic> drinksJson = response.data['drinks'];
        final List<Ingredient> drinksConverted = drinksJson
            .map((drinkJson) => Ingredient.fromJson(drinkJson))
            .toList();
        setState(() {
          ingredient =
              drinksConverted[Random().nextInt(drinksConverted.length)];
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
    getIngredient();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Header(ingredient: ingredient),
    );
  }
}
