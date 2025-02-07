import 'package:bacura_app/core/error/failaure.dart';
import 'package:bacura_app/feature/request_services/data/data_source/request_service_data_source.dart';
import 'package:bacura_app/feature/request_services/domin/repository/base_request_service_repository.dart';
import 'package:bacura_app/feature/request_services/domin/use_case/request_services_use_case.dart';
import 'package:dartz/dartz.dart';

class orderserviceRepository extends BaseorderserviceRepository {
  BaseorderserviceDataSource baseorderserviceDataSource;

  orderserviceRepository({required this.baseorderserviceDataSource});
  @override
  Future<Either<Failure, void>> orderservice({required orderservicesParams orderservicesParams}) async {
    try {
      return Right(await baseorderserviceDataSource.orderservice(orderservicesParams: orderservicesParams));
    } on Failure catch (ex) {
      return Left(ServerFailure(code: ex.code, message: ex.message));
    }
  }
}
