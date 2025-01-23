import 'package:get_it/get_it.dart';
import 'appwrite/appwriteConf.dart';

void initDependencies() {
  final getIt = GetIt.instance;
  getIt.registerLazySingleton(() => Appwriteconf());
}
