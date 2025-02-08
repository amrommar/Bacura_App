import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/my_orders/domin/entity/my_order_entity.dart';
import 'package:bacura_app/feature/my_orders/domin/repository/base_my_order_repository.dart';
import 'package:dartz/dartz.dart';

class GetMyOrdersUseCase extends BaseUseCases<MyOrderEntity, MyOrdersParameters> {
  BaseMyOrderRepository baseMyOrderRepository;

  GetMyOrdersUseCase({required this.baseMyOrderRepository});

  @override
  Future<Either<Failure, MyOrderEntity>> call(parameters) async {
    return await baseMyOrderRepository.getOrder(myOrdersParameters: parameters);
  }
}

class MyOrdersParameters extends Equatable {
  final int page;
  final int limit;

  const MyOrdersParameters({this.page = 1, this.limit = 1000});

  Map<String, dynamic> toMap() => {
        "page": page,
        "limit": limit,
      };

  @override
  List<Object?> get props => [page, limit];
}
