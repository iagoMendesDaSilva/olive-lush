import 'package:dio/dio.dart';
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
}
