import 'package:dio/dio.dart';
import 'package:olive_lush/models/Drink.dart';

import '../../services/api.dart';


class DiscoverViewModel {
  final Dio _dio;

  DiscoverViewModel(Dio dio): _dio = dio;

  Future<List<Drink>> getRandomDrink() async {
    try {
      var response = await _dio.get(Api.RANDOM_DRINK_URL);
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
