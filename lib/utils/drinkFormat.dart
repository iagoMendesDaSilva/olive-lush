import 'package:flutter/material.dart';

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
}
