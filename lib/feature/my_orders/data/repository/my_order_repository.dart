import 'package:bacura_app/core/error/failaure.dart';
import 'package:bacura_app/feature/my_orders/data/data_source/my_order_data_source.dart';
import 'package:bacura_app/feature/my_orders/domain/entity/items_for_order_entity.dart';
import 'package:bacura_app/feature/my_orders/domain/entity/my_order_entity.dart';
import 'package:bacura_app/feature/my_orders/domain/repository/base_my_order_repository.dart';
import 'package:bacura_app/feature/my_orders/domain/use_case/cancel_order_use_case.dart';
import 'package:bacura_app/feature/my_orders/domain/use_case/get_my_orders_use_case.dart';
import 'package:dartz/dartz.dart';

class MyOrderRepository extends BaseMyOrderRepository {
  BaseOrderDataSource baseOrderDataSource;

  MyOrderRepository({required this.baseOrderDataSource});

  @override
  Future<Either<Failure, MyOrderEntity>> getOrder({required MyOrdersParameters myOrdersParameters}) async {
    try {
      return Right(await baseOrderDataSource.getOrder(myOrdersParameters: myOrdersParameters));
    } on Failure catch (ex) {
      return Left(ServerFailure(code: ex.code, message: ex.message));
    }
  }

  @override
  Future<Either<Failure, List<ItemsForOrderEntity>>> getItems({required int id}) async {
    try {
      return Right(await baseOrderDataSource.getItems(id: id));
    } on Failure catch (ex) {
      return Left(ServerFailure(code: ex.code, message: ex.message));
    }
  }

  @override
  Future<Either<Failure, void>> cancelOrder({required CancelOrderParameter parameters}) async {
    try {
      return Right(await baseOrderDataSource.changeOrderStatus(parameters: parameters));
    } on Failure catch (ex) {
      return Left(ServerFailure(code: ex.code, message: ex.message));
    }
  }
}
