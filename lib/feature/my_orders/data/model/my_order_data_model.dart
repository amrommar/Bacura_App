import 'package:bacura_app/feature/my_orders/domin/entity/my_order_data_entity.dart';

class MyOrderDataModel extends MyOrderDataEntity {
  const MyOrderDataModel({
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
    required super.total,
    required super.createdAt,
    required super.expiresAt,
  });

  factory MyOrderDataModel.fromJson(Map<String, dynamic> json) => MyOrderDataModel(
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
        total: json["total"] ?? 0,
        createdAt: json["created_at"] ?? "",
        expiresAt: json["warranty_expiration_date"] ?? "",
      );
}
