import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/order_services/domin/repository/base_order_service_repository.dart';
import 'package:dartz/dartz.dart';

class OrderServicesUseCase extends BaseUseCases<void, OrderServicesParams> {
  BaseOrderServiceRepository baseOrderServiceRepository;

  OrderServicesUseCase({required this.baseOrderServiceRepository});
  @override
  Future<Either<Failure, void>> call(parameters) async {
    return await baseOrderServiceRepository.orderService(orderServicesParams: parameters);
  }
}

class OrderServicesParams {
  final String location;
  final String date;
  final String time;
  final int serviceId;
  final int categoryId;
  final String description;
  final double? longitude;
  final double? latitude;

  const OrderServicesParams({
    required this.location,
    required this.date,
    required this.time,
    required this.serviceId,
    required this.categoryId,
    required this.description,
    this.longitude,
    this.latitude,
  });
  Map<String, dynamic> toMap() {
    return {
      'location': location,
      'communication_date': date,
      'communication_time': time,
      'service_id': serviceId,
      'category_id': categoryId,
      'description': description,
      'longitude': longitude,
      'latitude': latitude,
    }..removeWhere((key, value) => value == null || value.toString().isEmpty);
  }
}
