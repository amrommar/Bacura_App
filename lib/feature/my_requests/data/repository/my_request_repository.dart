import 'package:bacura_app/core/error/failaure.dart';
import 'package:bacura_app/feature/my_orders/data/data_source/my_request_data_source.dart';
import 'package:bacura_app/feature/my_orders/domin/entity/my_request_entity.dart';
import 'package:bacura_app/feature/my_orders/domin/repository/base_my_request_repository.dart';
import 'package:bacura_app/feature/my_orders/domin/use_case/get_my_orders_use_case.dart';

import 'package:dartz/dartz.dart';

class MyRequestRepository extends BaseMyRequestRepository {
  BaseRequestDataSource baseRequestDataSource;

  MyRequestRepository({required this.baseRequestDataSource});
  @override
  Future<Either<Failure, MyRequestEntity>> getRequest({required MyordersParameters myordersParameters}) async {
    try {
      return Right(await baseRequestDataSource.getRequest(myordersParameters: myordersParameters));
    } on Failure catch (ex) {
      return Left(ServerFailure(code: ex.code, message: ex.message));
    }
  }
}
