import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/request_services/domin/repository/base_request_service_repository.dart';
import 'package:dartz/dartz.dart';

class RequestServicesUseCase extends BaseUseCases<void, RequestServicesParams> {
  BaseRequestServiceRepository baseRequestServiceRepository;

  RequestServicesUseCase({required this.baseRequestServiceRepository});
  @override
  Future<Either<Failure, void>> call(parameters) async {
    return await baseRequestServiceRepository.requestService(requestServicesParams: parameters);
  }
}

class RequestServicesParams {
  final String location;
  final String date;
  final String time;
  final int serviceId;
  final int categoryId;
  final String description;
  final double? longitude;
  final double? latitude;

  const RequestServicesParams({
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
