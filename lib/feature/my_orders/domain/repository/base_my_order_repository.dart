import 'package:bacura_app/core/error/failaure.dart';
import 'package:bacura_app/feature/my_orders/domain/entity/items_for_order_entity.dart';
import 'package:bacura_app/feature/my_orders/domain/entity/my_order_entity.dart';
import 'package:bacura_app/feature/my_orders/domain/use_case/get_my_orders_use_case.dart';
import 'package:dartz/dartz.dart';

abstract class BaseMyOrderRepository {
  Future<Either<Failure, MyOrderEntity>> getOrder({required MyOrdersParameters myOrdersParameters});
  Future<Either<Failure, List<ItemsForOrderEntity>>> getItems({required int id});
}
