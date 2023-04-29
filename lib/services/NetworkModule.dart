import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class NetworkModule {
  static Future<void> init() async {
    final dio = Dio();
    GetIt.instance.registerSingleton<Dio>(dio);
  }
}