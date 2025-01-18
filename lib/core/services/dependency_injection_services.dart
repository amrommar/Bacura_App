import 'package:bacura_app/core/utils/index.dart';

final sl = GetIt.instance;

class DependencyInjectionServices {
  init() async {
    _initializeLoginUser();
  }

  _initializeLoginUser() {
    //    /// Repository
    sl.registerLazySingleton<BaseAuthRepository>(() => AuthRepository(baseAuthRemoteDataSource: sl()));

    ///Data Sources
    sl.registerLazySingleton<BaseAuthRemoteDataSource>(() => AuthRemoteDataSource());

    ///Use Cases
    sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(baseAuthRepository: sl()));
  }
}
