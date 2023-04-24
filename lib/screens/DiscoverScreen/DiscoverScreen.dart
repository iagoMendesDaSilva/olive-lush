import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:olive_lush/commons/commons.dart';
import 'package:olive_lush/strings.dart' as StringResource;

import '../../models/GlassType.dart';
import 'commons/DrinkItem.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DiscoverScreenState();
}

class DiscoverScreenState extends State<DiscoverScreen> {
  var jsonList;

  void getDrinks() async {
    try {
      var response = await Dio().get(
          'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita');
      if (response.statusCode == 200) {
        setState(() {
          jsonList = response.data['drinks'] as List;
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
                  itemCount: jsonList == null ? 0 : jsonList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: EdgeInsets.only(top: 7.0, bottom: 7.0),
                        child: DrinkItem(
                          name: jsonList[index]['strDrink'],
                          description: jsonList[index]['strInstructions'],
                          glassType: getGlassType(jsonList[index]['strGlass']),
                          difficult: jsonList[index]['strCategory'],
                          img: jsonList[index]['strDrinkThumb'],
                        ));
                  })))
    ]);
  }

  getGlassType(glassType) {
    return (glassType == "Cocktail glass")
        ? GlassType(StringResource.strings['glass_cocktail']!, Icons.local_bar)
        : GlassType(StringResource.strings['glass_champagne']!, Icons.wine_bar);
  }
}
