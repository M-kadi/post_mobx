import 'package:get_it/get_it.dart';
import 'package:posts_mobx/dio_api/users_api.dart';
import 'package:posts_mobx/pages/content_home_screen/content_home_model.dart';
import 'package:posts_mobx/pages/users/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'preferences_service.dart';
import 'provider_service.dart';

GetIt locator = GetIt.instance;

Future<void> setup() async {
  // Must first add SharedPreferences
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => sharedPreferences);
  locator.registerLazySingleton(() => PreferencesService());

  locator.registerLazySingleton(() => UserModel());

  locator.registerLazySingleton(() => ProviderService());


  locator.registerLazySingleton(() => ContentHomeModel());

  locator.registerLazySingleton(() => UsersApi());
}