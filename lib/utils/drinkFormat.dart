import 'package:flutter/material.dart';

import '../models/Alcoholic.dart';
import '../models/GlassType.dart';
import 'package:olive_lush/utils/strings.dart' as StringResource;

class DrinkFormat {
  static getGlassType(glassType) {
    return (glassType == "Cocktail glass")
        ? GlassType(StringResource.strings['glass_cocktail']!, Icons.local_bar)
        : GlassType(StringResource.strings['glass_champagne']!, Icons.wine_bar);
  }

  static getIngredients(drink) {
    List<String> ingredients = [];

    drink.forEach((key, value) {
      if (key.startsWith('strIngredient') && value != null)
        ingredients.add(value);
    });

    return ingredients;
  }

  static convertAlcoholicType(type){
    switch (type.toLowerCase()) {
      case 'alcoholic':
        return AlcoholicType.Alcoholic;
      case 'non alcoholic':
        return AlcoholicType.NonAlcoholic;
      default:
        return AlcoholicType.OptionalAlcoholic;
    }
  }


  static getAlcoholic(alcoholic) {
    var alcoholicType = Alcoholic.convertAlcoholicType(alcoholic);
     switch (alcoholicType) {
       case AlcoholicType.Alcoholic:
        return Alcoholic(StringResource.strings['alcoholic']!, Icons.local_bar);
       case AlcoholicType.NonAlcoholic:
        return Alcoholic(StringResource.strings['non_alcoholic']!, Icons.no_drinks);
      default:
        return Alcoholic(StringResource.strings['optional_alcoholic']!, Icons.local_bar);
    }
  }
}
