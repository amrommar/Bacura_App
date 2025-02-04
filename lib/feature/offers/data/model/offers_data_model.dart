import 'package:bacura_app/feature/offers/domin/entity/offers_data_entity.dart';

class OffersDataModel extends OffersDataEntity {
  const OffersDataModel({
    required super.id,
    required super.description,
    required super.serviceId,
    required super.service,
    required super.categoryId,
    required super.name,
    required super.total,
    required super.createdAt,
    required super.expiresAt,
    required super.image,
    required super.usageCount,
  });
  factory OffersDataModel.fromJson(Map<String, dynamic> json) => OffersDataModel(
        id: json["id"] ?? 0,
        description: json["description"] ?? "",
        serviceId: json["service_id"] ?? 0,
        service: json["service"],
        categoryId: json["category_id"] ?? 0,
        name: json["name"] ?? "",
        total: json["total"] ?? 0,
        createdAt: json["created_at"] ?? "",
        expiresAt: json["expires_at"] ?? "",
        image: json["image"] ?? "",
        usageCount: json["usage_count"] ?? 0,
      );
}
