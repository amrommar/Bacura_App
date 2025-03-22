import 'package:bacura_app/core/error/failaure.dart';
import 'package:bacura_app/feature/my_orders/domain/entity/my_order_data_entity.dart';
import 'package:bacura_app/feature/my_orders/domain/entity/my_order_entity.dart';
import 'package:bacura_app/feature/technician_app/profile/domain/use_case/completed_orders_use_case.dart';
import 'package:bacura_app/feature/technician_app/profile/domain/use_case/get_orders_calender_use_case.dart';
import 'package:dartz/dartz.dart';

abstract class BaseCompletedOrdersRepository {
  Future<Either<Failure, MyOrderEntity>> completedOrder(
      {required MyCompletedOrdersParameters myCompletedOrdersParameters});
  Future<Either<Failure, List<MyOrderDataEntity>>> calenderOrders(
      {required MyOrdersCalenderParameter myOrdersCalenderParameter});
}
