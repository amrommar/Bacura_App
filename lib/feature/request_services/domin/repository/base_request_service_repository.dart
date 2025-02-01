import 'package:bacura_app/core/error/failaure.dart';
import 'package:bacura_app/feature/request_services/domin/use_case/request_services_use_case.dart';
import 'package:dartz/dartz.dart';

abstract class BaseRequestServiceRepository {
  Future<Either<Failure, void>> requestService({required RequestServicesParams requestServicesParams});
}
