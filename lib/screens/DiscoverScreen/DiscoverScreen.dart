import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:olive_lush/commons/commons.dart';
import 'package:olive_lush/utils/strings.dart' as StringResource;

import '../../services/api.dart';
import '../../utils/drinkFormat.dart';
import 'commons/HandPickedDrink.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DiscoverScreenState();
}

class DiscoverScreenState extends State<DiscoverScreen> {
  var drink;
  var loading = true;

  void getDrink() async {
    try {
      final Dio dio = GetIt.instance<Dio>();
      var response = await dio.get(RANDOM_DRINK_URL);
      if (response.statusCode == 200) {
        setState(() {
          drink = response.data['drinks'][0];
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
    getDrink();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Header(text: StringResource.strings['header_discover']),
      Expanded(
          child: loading
              ? Load()
              : drink == null
                  ? EmptyList()
                  : HandPickedDrink(
                      name: drink['strDrink'],
                      description: drink['strInstructions'],
                      alcoholic: DrinkFormat.getAlcoholic(drink['strAlcoholic']),
                      img: drink['strDrinkThumb'],
                    ))
    ]);
  }
}
