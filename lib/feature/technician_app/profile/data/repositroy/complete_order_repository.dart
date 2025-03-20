import 'package:bacura_app/core/error/failaure.dart';
import 'package:bacura_app/feature/my_orders/domain/entity/my_order_entity.dart';

import 'package:bacura_app/feature/technician_app/profile/data/data_source/complete_order_data_source.dart';
import 'package:bacura_app/feature/technician_app/profile/domain/repository/base_completed_orders_repository.dart';
import 'package:bacura_app/feature/technician_app/profile/domain/use_case/completed_orders_use_case.dart';
import 'package:dartz/dartz.dart';

class CompleteOrderRepository extends BaseCompletedOrdersRepository {
  BaseCompletedOrderDataSource baseCompletedOrderDataSource;

  CompleteOrderRepository({required this.baseCompletedOrderDataSource});

  @override
  Future<Either<Failure, MyOrderEntity>> completedOrder(
      {required MyCompletedOrdersParameters myCompletedOrdersParameters}) async {
    try {
      return Right(
          await baseCompletedOrderDataSource.completedOrder(myCompletedOrdersParameters: myCompletedOrdersParameters));
    } on Failure catch (ex) {
      return Left(ServerFailure(code: ex.code, message: ex.message));
    }
  }
}
