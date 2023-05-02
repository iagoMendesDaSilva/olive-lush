import 'package:dio/dio.dart';
import 'package:olive_lush/models/Drink.dart';
import 'package:olive_lush/models/DrinkByIngredient.dart';
import 'package:olive_lush/models/Ingredient.dart';

import '../../services/api.dart';

class CollectionViewModel {
  final Dio _dio;

  CollectionViewModel(Dio dio) : _dio = dio;

  Future<List<Ingredient>> getIngredients() async {
    try {
      var response = await _dio.get(Api.INGREDIENTS_URL);
      if (response.statusCode == 200) {
        final List<dynamic> drinksJson = response.data['drinks'];
        final List<Ingredient> drinksConverted = drinksJson.map((drinkJson) => Ingredient.fromJson(drinkJson)).toList();
        return drinksConverted;
      }
    } catch (w) {
      print(w);
    }
    return [];
  }

  Future<List<DrinkByIngredient>> getByIngredients(String ingredient) async {
    try {
      var response = await _dio.get(Api.DRINKS_BY_INGREDIENT_URL + ingredient);
      if (response.statusCode == 200) {
        final List<dynamic> drinksJson = response.data['drinks'];
        final List<DrinkByIngredient> drinksConverted = drinksJson.map((drinkJson) => DrinkByIngredient.fromJson(drinkJson)).toList();
        return drinksConverted;
      }
    } catch (w) {
      print(w);
    }
    return [];
  }

  Future<List<Drink>> getDrinkById(String id) async {
    try {
      var response = await _dio.get(Api.DRINKS_BY_ID_URL + id);
      if (response.statusCode == 200) {
        final List<dynamic> drinksJson = response.data['drinks'];
        final List<Drink> drinksConverted = drinksJson.map((drinkJson) => Drink.fromJson(drinkJson)).toList();
        return drinksConverted;
      }
    } catch (w) {
      print(w);
    }
    return [];
  }
}
