import 'package:bacura_app/core/error/failaure.dart';
import 'package:bacura_app/feature/my_requests/domin/entity/my_request_entity.dart';
import 'package:bacura_app/feature/my_requests/domin/use_case/get_my_requests_use_case.dart';
import 'package:dartz/dartz.dart';

abstract class BaseMyRequestRepository {
  Future<Either<Failure, MyRequestEntity>> getRequest({required MyRequestsParameters myRequestsParameters});
}
