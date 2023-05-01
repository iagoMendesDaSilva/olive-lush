import 'package:flutter/material.dart';

import 'Alcoholic.dart';
import 'package:olive_lush/utils/strings.dart' as StringResource;

import 'GlassType.dart';

class Drink{
  final String id;
  final String name;
  final String? alternateName;
  final String? tags;
  final String? video;
  final String? category;
  final String? iba;
  final Alcoholic alcoholic;
  final GlassType? glass;
  final String instructions;
  final Map<String, String?> ingredients;
  final Map<String, String?> measures;
  final String drinkThumb;
  final String? imageSource;
  final String? imageAttribution;
  final bool? creativeCommonsConfirmed;
  final String? dateModified;

  Drink({
    required this.id,
    required this.name,
    this.alternateName,
    this.tags,
    this.video,
    required this.category,
    this.iba,
    required this.alcoholic,
    required this.glass,
    required this.instructions,
    required this.ingredients,
    required this.measures,
    required this.drinkThumb,
    this.imageSource,
    this.imageAttribution,
    required this.creativeCommonsConfirmed,
    required this.dateModified,
  });

  factory Drink.fromJson(Map<String, dynamic> json) {
    final ingredients = Map<String, String?>.fromIterable(
      Iterable.generate(15, (i) => i + 1),
      key: (i) => 'strIngredient$i',
      value: (i) => json['strIngredient$i'],
    );

    final measures = Map<String, String?>.fromIterable(
      Iterable.generate(15, (i) => i + 1),
      key: (i) => 'strMeasure$i',
      value: (i) => json['strMeasure$i'],
    );

     convertAlcoholicType(type){
      switch (type.toLowerCase()) {
        case 'alcoholic':
          return AlcoholicType.Alcoholic;
        case 'non alcoholic':
          return AlcoholicType.NonAlcoholic;
        default:
          return AlcoholicType.OptionalAlcoholic;
      }
    }

     getAlcoholic(alcoholic) {
      var alcoholicType = convertAlcoholicType(alcoholic);
      switch (alcoholicType) {
        case AlcoholicType.Alcoholic:
          return Alcoholic(StringResource.strings['alcoholic']!, Icons.local_bar);
        case AlcoholicType.NonAlcoholic:
          return Alcoholic(StringResource.strings['non_alcoholic']!, Icons.no_drinks);
        default:
          return Alcoholic(StringResource.strings['optional_alcoholic']!, Icons.local_bar);
      }
    }

    getGlassType(glassType) {
      return (glassType == "Cocktail glass")
          ? GlassType(StringResource.strings['glass_cocktail']!, Icons.local_bar)
          : GlassType(StringResource.strings['glass_champagne']!, Icons.wine_bar);
    }

    return Drink(
      id: json['idDrink'],
      name: json['strDrink'],
      alternateName: json['strDrinkAlternate'],
      tags: json['strTags'],
      video: json['strVideo'],
      category: json['strCategory'],
      iba: json['strIBA'],
      alcoholic: getAlcoholic(json['strAlcoholic']),
      glass: getGlassType(json['strGlass']),
      instructions: json['strInstructions'],
      ingredients: ingredients,
      measures: measures,
      drinkThumb: json['strDrinkThumb'],
      imageSource: json['strImageSource'],
      imageAttribution: json['strImageAttribution'],
      creativeCommonsConfirmed: json['strCreativeCommonsConfirmed'] == 'Yes',
      dateModified: json['dateModified'],
    );
  }
}