import 'package:agucareer/repository/user_repository.dart';
import 'package:agucareer/services/fireabase_storage_service.dart';
import 'package:agucareer/services/firebase_auth_service.dart';
import 'package:agucareer/services/firestore_db_service.dart';
import 'package:agucareer/services/local_db_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator(){
  locator.registerLazySingleton(() => FirebaseAuthService());
  locator.registerLazySingleton(() => FirestoreDBService());
  locator.registerLazySingleton(() => FirebaseStorageService());
  locator.registerLazySingleton(() => LocaleDBService());
  locator.registerLazySingleton(() => UserRepository());
}