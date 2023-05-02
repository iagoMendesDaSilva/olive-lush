import 'package:dio/dio.dart';
import 'package:olive_lush/models/Drink.dart';

import '../../services/api.dart';

class DrinksViewModel {
  final Dio _dio;

  DrinksViewModel(Dio dio) : _dio = dio;

  Future<List<Drink>> getDrinks() async {
    try {
      var response = await _dio.get(Api.INITIAL_SEARCH_URL);
      if (response.statusCode == 200) {
        final List<dynamic> drinksJson = response.data['drinks'];
        final List<Drink> drinksConverted =
            drinksJson.map((drinkJson) => Drink.fromJson(drinkJson)).toList();
        return drinksConverted;
      }
    } catch (w) {
      print(w);
    }
    return [];
  }

  Future<List<Drink>> searchDrinks(String searchText) async {
    try {
      var response = await _dio.get(Api.SEARCH_URL + searchText);
      if (response.statusCode == 200) {
        final List<dynamic> drinksJson = response.data['drinks'];
        final List<Drink> drinksConverted =
            drinksJson.map((drinkJson) => Drink.fromJson(drinkJson)).toList();
        return drinksConverted;
      }
    } catch (w) {
      print(w);
    }
    return [];
  }
}
