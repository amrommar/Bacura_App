import 'package:bacura_app/core/error/failaure.dart';
import 'package:bacura_app/feature/order_services/domin/use_case/order_services_use_case.dart';
import 'package:dartz/dartz.dart';

abstract class BaseOrderServiceRepository {
  Future<Either<Failure, void>> orderService({required OrderServicesParams orderServicesParams});
}
