import 'package:bacura_app/feature/auth/index.dart';
import 'package:bacura_app/feature/home/data/data_source/home_data_source.dart';
import 'package:bacura_app/feature/home/data/repository/home_repository.dart';
import 'package:bacura_app/feature/home/domain/repository/base_home_repository.dart';
import 'package:bacura_app/feature/home/domain/use_case/get_banner_use_case.dart';
import 'package:bacura_app/feature/home/domain/use_case/get_category_use_case.dart';
import 'package:bacura_app/feature/home/domain/use_case/on_banner_clicked_use_case.dart';
import 'package:bacura_app/feature/more/data/data_source/more_remote_data_source.dart';
import 'package:bacura_app/feature/more/data/repositories/more_repository.dart';
import 'package:bacura_app/feature/more/domain/repositories/base_more_repository.dart';
import 'package:bacura_app/feature/more/domain/usecases/suggetions_use_case.dart';
import 'package:bacura_app/feature/my_orders/data/data_source/my_order_data_source.dart';
import 'package:bacura_app/feature/my_orders/data/repository/my_order_repository.dart';
import 'package:bacura_app/feature/my_orders/domin/repository/base_my_order_repository.dart';
import 'package:bacura_app/feature/my_orders/domin/use_case/get_my_orders_use_case.dart';
import 'package:bacura_app/feature/my_orders/domin/use_case/items_for_order_use_case.dart';
import 'package:bacura_app/feature/offers/data/data_source/offers_data_source.dart';
import 'package:bacura_app/feature/offers/data/repository/offers_repository.dart';
import 'package:bacura_app/feature/offers/domin/repository/base_offers_repository.dart';
import 'package:bacura_app/feature/offers/domin/use_case/get_my_requests_use_case.dart';
import 'package:bacura_app/feature/order_services/data/data_source/order_service_data_source.dart';
import 'package:bacura_app/feature/order_services/data/repository/order_service_repository.dart';
import 'package:bacura_app/feature/order_services/domin/repository/base_order_service_repository.dart';
import 'package:bacura_app/feature/order_services/domin/use_case/order_services_use_case.dart';
import 'package:bacura_app/feature/profile/data/data_source/profile_data_source.dart';
import 'package:bacura_app/feature/profile/data/repository/profile_repository.dart';
import 'package:bacura_app/feature/profile/domain/repository/base_profile_repository.dart';
import 'package:bacura_app/feature/profile/domain/use_case/my_profile_use_case.dart';
import 'package:bacura_app/feature/profile/domain/use_case/update_profile_use_case.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class DependencyInjectionServices {
  init() async {
    _initializeAuthUser();
    _initializeProfileUser();
    _initializeHomeUser();
    _initializeorderservice();
    _initializeMyorderservice();
    _initializeMoreApp();
    _initializeOffers();
  }

  _initializeAuthUser() {
    // Repository
    sl.registerLazySingleton<BaseAuthRepository>(() => AuthRepository(baseAuthRemoteDataSource: sl()));

    ///Data Sources
    sl.registerLazySingleton<BaseAuthRemoteDataSource>(() => AuthRemoteDataSource());

    ///Use Cases
    sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(baseAuthRepository: sl()));
    sl.registerLazySingleton<VerifyOTPUseCase>(() => VerifyOTPUseCase(baseAuthRepository: sl()));
    sl.registerLazySingleton<CompleteProfileUseCase>(() => CompleteProfileUseCase(baseAuthRepository: sl()));
  }

  _initializeProfileUser() {
    // Repository
    sl.registerLazySingleton<BaseProfileRepository>(() => ProfileRepository(baseProfileDataSource: sl()));

    ///Data Sources
    sl.registerLazySingleton<BaseProfileDataSource>(() => ProfileDataSource());

    ///Use Cases
    sl.registerLazySingleton<MyProfileUseCase>(() => MyProfileUseCase(baseProfileRepository: sl()));
    sl.registerLazySingleton<UpdateProfileUseCase>(() => UpdateProfileUseCase(baseProfileRepository: sl()));
  }

  _initializeHomeUser() {
    // Repository
    sl.registerLazySingleton<BaseHomeRepository>(() => HomeRepository(baseHomeDataSource: sl()));

    ///Data Sources
    sl.registerLazySingleton<BaseHomeDataSource>(() => HomeDataSource());

    ///Use Cases
    sl.registerLazySingleton<GetBannerUseCase>(() => GetBannerUseCase(baseHomeRepository: sl()));
    sl.registerLazySingleton<OnBannerClickedUseCase>(() => OnBannerClickedUseCase(baseHomeRepository: sl()));
    sl.registerLazySingleton<GetCategoryUseCase>(() => GetCategoryUseCase(baseHomeRepository: sl()));
  }

  _initializeorderservice() {
    // Repository
    sl.registerLazySingleton<BaseOrderServiceRepository>(
        () => OrderServiceRepository(baseOrderServiceDataSource: sl()));

    ///Data Sources
    sl.registerLazySingleton<BaseOrderServiceDataSource>(() => OrderServiceDataSource());

    ///Use Cases
    sl.registerLazySingleton<OrderServicesUseCase>(() => OrderServicesUseCase(baseOrderServiceRepository: sl()));
  }

  _initializeMyorderservice() {
    // Repository
    sl.registerLazySingleton<BaseMyOrderRepository>(() => MyOrderRepository(baseOrderDataSource: sl()));

    ///Data Sources
    sl.registerLazySingleton<BaseOrderDataSource>(() => MyOrderDataSource());

    ///Use Cases
    sl.registerLazySingleton<GetMyOrdersUseCase>(() => GetMyOrdersUseCase(baseMyOrderRepository: sl()));
    sl.registerLazySingleton<ItemsForOrderUseCase>(() => ItemsForOrderUseCase(baseMyOrderRepository: sl()));
  }

  _initializeMoreApp() {
    // Repository
    sl.registerLazySingleton<BaseMoreRepository>(() => MoreRepository(baseMoreRemoteDataSource: sl()));

    ///Data Sources
    sl.registerLazySingleton<BaseMoreRemoteDataSource>(() => MoreRemoteDataSource());

    ///Use Cases
    sl.registerLazySingleton<SuggestionsUseCase>(() => SuggestionsUseCase(baseMoreRepository: sl()));
  }

  _initializeOffers() {
    // Repository
    sl.registerLazySingleton<BaseOffersRepository>(() => OffersRepository(baseRequestDataSource: sl()));

    ///Data Sources
    sl.registerLazySingleton<BaseOffersDataSource>(() => OffersDataSource());

    ///Use Cases
    sl.registerLazySingleton<GetOffersUseCase>(() => GetOffersUseCase(baseOffersRepository: sl()));
  }
}
