import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:olive_lush/commons/commons.dart';
import 'package:olive_lush/utils/strings.dart' as StringResource;

import '../../models/Drink.dart';
import '../../services/api.dart';
import 'commons/HandPickedDrink.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DiscoverScreenState();
}

class DiscoverScreenState extends State<DiscoverScreen> {
  late Drink drink;
  var loading = true;

  void getDrink() async {
    try {
      final Dio dio = GetIt.instance<Dio>();
      var response = await dio.get(RANDOM_DRINK_URL);
      if (response.statusCode == 200) {
        final List<dynamic> drinksJson = response.data['drinks'];
        final List<Drink> drinksConverted =
            drinksJson.map((drinkJson) => Drink.fromJson(drinkJson)).toList();
        setState(() {
          drink = drinksConverted[0];
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
              : HandPickedDrink(
                  name: drink.name,
                  description: drink.instructions,
                  alcoholic: drink.alcoholic,
                  img: drink.drinkThumb,
                ))
    ]);
  }
}
