import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/my_orders/domain/entity/services_order_entity.dart';

class OffersDataEntity extends Equatable {
  final int? id;
  final String? name;
  final int? total;
  final String? description;
  final int? serviceId;
  final int? categoryId;
  final String? createdAt;
  final String? expiresAt;
  final String? image;
  final ServicesOrderEntity? service;
  final int? usageCount;

  const OffersDataEntity(
      {this.id,
      this.name,
      this.total,
      this.description,
      this.createdAt,
      this.expiresAt,
      this.image,
      this.serviceId,
      this.service,
      this.categoryId,
      this.usageCount});

  @override
  List<Object?> get props => [
        id,
        name,
        total,
        description,
        createdAt,
        expiresAt,
        image,
        description,
        serviceId,
        service,
        categoryId,
        usageCount
      ];
}
