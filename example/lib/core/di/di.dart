import 'package:env/env.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setUpRegister(EnvValue env) {
  getIt.registerSingleton<EnvValue>(env);

  // Register your repositories and services here, for example:
  // getIt.registerLazySingleton<AuthRepository>(
  //   () => AuthRepositoryImpl(env: env),
  // );
}
