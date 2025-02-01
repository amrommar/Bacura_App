import 'package:bacura_app/core/error/failaure.dart';
import 'package:bacura_app/feature/my_requests/data/data_source/my_request_data_source.dart';
import 'package:bacura_app/feature/my_requests/domin/entity/my_request_entity.dart';
import 'package:bacura_app/feature/my_requests/domin/repository/base_my_request_repository.dart';
import 'package:bacura_app/feature/my_requests/domin/use_case/get_my_requests_use_case.dart';

import 'package:dartz/dartz.dart';

class MyRequestRepository extends BaseMyRequestRepository {
  BaseRequestDataSource baseRequestDataSource;

  MyRequestRepository({required this.baseRequestDataSource});
  @override
  Future<Either<Failure, MyRequestEntity>> getRequest({required MyRequestsParameters myRequestsParameters}) async {
    try {
      return Right(await baseRequestDataSource.getRequest(myRequestsParameters: myRequestsParameters));
    } on Failure catch (ex) {
      return Left(ServerFailure(code: ex.code, message: ex.message));
    }
  }
}
