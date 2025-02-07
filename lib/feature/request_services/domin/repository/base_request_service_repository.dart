import 'package:bacura_app/core/error/failaure.dart';
import 'package:bacura_app/feature/request_services/domin/use_case/request_services_use_case.dart';
import 'package:dartz/dartz.dart';

abstract class BaseorderserviceRepository {
  Future<Either<Failure, void>> orderservice({required orderservicesParams orderservicesParams});
}
