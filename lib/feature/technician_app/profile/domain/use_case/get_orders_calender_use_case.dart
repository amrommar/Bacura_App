import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/my_orders/domain/entity/my_order_data_entity.dart';
import 'package:bacura_app/feature/technician_app/profile/domain/repository/base_completed_orders_repository.dart';
import 'package:dartz/dartz.dart';

class GetOrdersCalenderUseCase extends BaseUseCases<List<MyOrderDataEntity>, MyOrdersCalenderParameter> {
  BaseCompletedOrdersRepository baseCompletedOrdersRepository;

  GetOrdersCalenderUseCase({required this.baseCompletedOrdersRepository});

  @override
  Future<Either<Failure, List<MyOrderDataEntity>>> call(parameters) async {
    return await baseCompletedOrdersRepository.calenderOrders(myOrdersCalenderParameter: parameters);
  }
}

class MyOrdersCalenderParameter extends Equatable {
  final String from;
  final String to;

  const MyOrdersCalenderParameter({required this.from, required this.to});

  Map<String, dynamic> toMap() => {
        "from": from,
        "to": to,
      };

  @override
  List<Object?> get props => [from, to];
}
