import 'package:flutter/material.dart';
import 'package:olive_lush/commons/commons.dart';
import 'package:olive_lush/utils/strings.dart' as StringResource;

import '../../di.dart';
import 'DiscoverViewModel.dart';
import '../../models/Drink.dart';
import 'commons/HandPickedDrink.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DiscoverScreenState();
}

class DiscoverScreenState extends State<DiscoverScreen> {
  Drink? drink;
  var loading = true;
  late DiscoverViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = getIt<DiscoverViewModel>();
    _viewModel.getRandomDrink().then((drinks) {
      setState(() {
        if (drinks.isNotEmpty) drink = drinks[0];
        loading = false;
      });
    });
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
                      name: drink!.name,
                      description: drink!.instructions,
                      alcoholic: drink!.alcoholic,
                      img: drink!.drinkThumb,
                    ))
    ]);
  }
}
