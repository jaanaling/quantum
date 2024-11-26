import 'package:get_it/get_it.dart';
import 'package:quantum/src/feature/balance/repository/repository.dart';

final locator = GetIt.instance;

void setupDependencyInjection() {
  locator.registerLazySingleton(()=>RepositoryBalance());
 }
