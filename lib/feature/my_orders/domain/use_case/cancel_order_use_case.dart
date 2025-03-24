import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/my_orders/domain/repository/base_my_order_repository.dart';
import 'package:dartz/dartz.dart';

class CancelOrderUseCase extends BaseUseCases<void, CancelOrderParameter> {
  BaseMyOrderRepository baseMyOrderRepository;
  CancelOrderUseCase({required this.baseMyOrderRepository});
  @override
  Future<Either<Failure, void>> call(CancelOrderParameter parameters) {
    return baseMyOrderRepository.cancelOrder(parameters: parameters);
  }
}

class CancelOrderParameter extends Equatable {
  final String status;
  final int id;

  const CancelOrderParameter({required this.status, required this.id});

  Map<String, dynamic> toMap() => {
        "status": status,
        "id": id,
      };

  @override
  List<Object?> get props => [status, id];
}
