import 'package:bacura_app/feature/my_requests/domin/entity/my_request_data_entity.dart';

class MyRequestDataModel extends MyRequestDataEntity {
  const MyRequestDataModel({
    required super.id,
    required super.status,
    required super.communicationDate,
    required super.communicationTime,
    required super.location,
    required super.longitude,
    required super.latitude,
    required super.description,
    required super.serviceId,
    required super.service,
    required super.categoryId,
  });
  factory MyRequestDataModel.fromJson(Map<String, dynamic> json) => MyRequestDataModel(
        id: json["id"] ?? 0,
        status: json["status"] ?? "unknown",
        communicationDate: json["communication_date"] ?? "",
        communicationTime: json["communication_time"] ?? "",
        location: json["location"] ?? "",
        longitude: (json["longitude"] as num?)?.toDouble() ?? 0.0,
        latitude: (json["latitude"] as num?)?.toDouble() ?? 0.0,
        description: json["description"] ?? "",
        serviceId: json["service_id"] ?? 0,
        service: json["service"],
        categoryId: json["category_id"] ?? 0,
      );
}
