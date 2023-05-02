import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:olive_lush/screens/DrinksScreen/DrinksViewModel.dart';
import 'package:olive_lush/screens/DiscoverScreen/DiscoverViewModel.dart';
import 'package:olive_lush/screens/CollectionScreen/CollectionViewModel.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerFactory<DrinksViewModel>(() => DrinksViewModel(getIt<Dio>()));
  getIt.registerFactory<DiscoverViewModel>(() => DiscoverViewModel(getIt<Dio>()));
  getIt.registerFactory<CollectionViewModel>(() => CollectionViewModel(getIt<Dio>()));

}
