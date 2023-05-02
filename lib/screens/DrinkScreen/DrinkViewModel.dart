import 'package:dio/dio.dart';
import 'package:olive_lush/models/Drink.dart';

import '../../services/api.dart';


class DrinkViewModel {
  final Dio _dio;

  DrinkViewModel(Dio dio): _dio = dio;

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
