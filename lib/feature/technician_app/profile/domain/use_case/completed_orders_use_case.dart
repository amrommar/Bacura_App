import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/my_orders/domain/entity/my_order_entity.dart';
import 'package:bacura_app/feature/technician_app/profile/domain/repository/base_completed_orders_repository.dart';
import 'package:dartz/dartz.dart';

class GetCompletedOrdersUseCase extends BaseUseCases<MyOrderEntity, MyCompletedOrdersParameters> {
  BaseCompletedOrdersRepository baseCompletedOrdersRepository;

  GetCompletedOrdersUseCase({required this.baseCompletedOrdersRepository});

  @override
  Future<Either<Failure, MyOrderEntity>> call(parameters) async {
    return await baseCompletedOrdersRepository.completedOrder(myCompletedOrdersParameters: parameters);
  }
}

class MyCompletedOrdersParameters extends Equatable {
  final int page;
  final int limit;

  const MyCompletedOrdersParameters({this.page = 1, this.limit = 1000});

  Map<String, dynamic> toMap() => {
        "page": page,
        "limit": limit,
      };

  @override
  List<Object?> get props => [page, limit];
}
