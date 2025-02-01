import 'package:bacura_app/core/error/failaure.dart';
import 'package:bacura_app/feature/request_services/data/data_source/request_service_data_source.dart';
import 'package:bacura_app/feature/request_services/domin/repository/base_request_service_repository.dart';
import 'package:bacura_app/feature/request_services/domin/use_case/request_services_use_case.dart';
import 'package:dartz/dartz.dart';

class RequestServiceRepository extends BaseRequestServiceRepository {
  BaseRequestServiceDataSource baseRequestServiceDataSource;

  RequestServiceRepository({required this.baseRequestServiceDataSource});
  @override
  Future<Either<Failure, void>> requestService({required RequestServicesParams requestServicesParams}) async {
    try {
      return Right(await baseRequestServiceDataSource.requestService(requestServicesParams: requestServicesParams));
    } on Failure catch (ex) {
      return Left(ServerFailure(code: ex.code, message: ex.message));
    }
  }
}
