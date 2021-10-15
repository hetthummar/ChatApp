import 'package:chatapp/data/DataManager.dart';
import 'package:chatapp/data/local/jsonStoreService.dart';
import 'package:chatapp/data/network/Client.dart';
import 'package:chatapp/data/prefs/SharedpreferenceService.dart';
import 'package:chatapp/services/FirebaseAuthService.dart';
import 'package:chatapp/services/PushNotificationService.dart';
import 'package:chatapp/ui/screens/base/base_view_model.dart';
import 'package:chatapp/ui/screens/base/temp/TempViewModel.dart';
import 'package:chatapp/ui/screens/main_screen/MainScreenHolderViewModel.dart';
import 'package:chatapp/ui/screens/main_screen/fragments/home_view/HomeViewModel.dart';
import 'package:chatapp/ui/screens/main_screen/fragments/profile_view/ProfileViewModel.dart';
import 'package:chatapp/ui/screens/startup/StartupViewmodel.dart';
import 'package:chatapp/utils/StartupHelpers.dart';
import 'package:get_it/get_it.dart';
import 'package:json_store/json_store.dart';
import 'package:stacked_services/stacked_services.dart';

GetIt locator = GetIt.I;

void setupLocator() {
  locator.registerLazySingleton(() => SharedPreferenceService());
  locator.registerLazySingleton(() => jsonStoreService());
  locator.registerLazySingleton(() => DataManager());
  locator.registerLazySingleton(() => FirebaseAuthService());
  locator.registerFactory(() => BaseModel());
  locator.registerFactory(() => TempViewModel());
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => StartupViewModel());
  locator.registerLazySingleton(() => PushNotificationService());
  locator.registerLazySingleton(() => Client());
  locator.registerLazySingleton(() => JsonStore());
  locator.registerLazySingleton(() => HomeViewModel());
  locator.registerLazySingleton(() => StartupHelpers());
  locator.registerLazySingleton(() => ProfileViewModel());
  locator.registerLazySingleton(() => MainScreenHolderViewModel());
}
