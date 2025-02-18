import 'package:bacura_app/core/services/usecases.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/my_orders/domain/entity/items_for_order_entity.dart';
import 'package:bacura_app/feature/my_orders/domain/repository/base_my_order_repository.dart';
import 'package:dartz/dartz.dart';

class ItemsForOrderUseCase extends BaseUseCases<List<ItemsForOrderEntity>, int> {
  BaseMyOrderRepository baseMyOrderRepository;
  ItemsForOrderUseCase({required this.baseMyOrderRepository});
  @override
  Future<Either<Failure, List<ItemsForOrderEntity>>> call(int parameters) {
    return baseMyOrderRepository.getItems(id: parameters);
  }
}
