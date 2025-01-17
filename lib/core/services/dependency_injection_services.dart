import 'package:bacura_app/feature/auth/data/DataSource/auth_remote_data_source.dart';
import 'package:bacura_app/feature/auth/data/Repositories/auth_repository_impl.dart';
import 'package:bacura_app/feature/auth/domain/Repositories/base_auth_repository.dart';
import 'package:bacura_app/feature/auth/domain/usecases/login_usecase.dart';
import 'package:get_it/get_it.dart';

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
