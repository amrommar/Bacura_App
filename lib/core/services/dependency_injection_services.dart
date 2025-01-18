import 'package:bacura_app/feature/auth/domain/usecases/verify_usecase.dart';
import 'package:bacura_app/feature/auth/index.dart';
import 'package:bacura_app/feature/profile/data/data_source/profile_data_source.dart';
import 'package:bacura_app/feature/profile/data/repository/profile_repository.dart';
import 'package:bacura_app/feature/profile/domain/repository/base_profile_repository.dart';
import 'package:bacura_app/feature/profile/domain/use_case/complete_profile_use_case.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class DependencyInjectionServices {
  init() async {
    _initializeAuthUser();
    _initializeProfileUser();
  }

  _initializeAuthUser() {
    // Repository
    sl.registerLazySingleton<BaseAuthRepository>(() => AuthRepository(baseAuthRemoteDataSource: sl()));

    ///Data Sources
    sl.registerLazySingleton<BaseAuthRemoteDataSource>(() => AuthRemoteDataSource());

    ///Use Cases
    sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(baseAuthRepository: sl()));
    sl.registerLazySingleton<VerifyOTPUseCase>(() => VerifyOTPUseCase(baseAuthRepository: sl()));
  }

  _initializeProfileUser() {
    // Repository
    sl.registerLazySingleton<BaseProfileRepository>(() => ProfileRepository(baseProfileDataSource: sl()));

    ///Data Sources
    sl.registerLazySingleton<BaseProfileDataSource>(() => ProfileDataSource());

    ///Use Cases
    sl.registerLazySingleton<CompleteProfileUseCase>(() => CompleteProfileUseCase(baseProfileRepository: sl()));
  }
}
