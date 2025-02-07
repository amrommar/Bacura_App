import 'package:bacura_app/core/error/failaure.dart';
import 'package:bacura_app/feature/order_services/data/data_source/order_service_data_source.dart';
import 'package:bacura_app/feature/order_services/domin/repository/base_order_service_repository.dart';
import 'package:bacura_app/feature/order_services/domin/use_case/order_services_use_case.dart';
import 'package:dartz/dartz.dart';

class OrderServiceRepository extends BaseOrderServiceRepository {
  BaseOrderServiceDataSource baseOrderServiceDataSource;

  OrderServiceRepository({required this.baseOrderServiceDataSource});

  @override
  Future<Either<Failure, void>> orderService({required OrderServicesParams orderServicesParams}) async {
    try {
      return Right(await baseOrderServiceDataSource.orderService(orderServicesParams: orderServicesParams));
    } on Failure catch (ex) {
      return Left(ServerFailure(code: ex.code, message: ex.message));
    }
  }
}
