import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/my_orders/domain/entity/services_order_entity.dart';

class MyOrderDataEntity extends Equatable {
  final int? id;
  final int? total;
  final String? status;
  final String? communicationDate;
  final String? communicationTime;
  final String? location;
  final double? longitude;
  final double? latitude;
  final String description;
  final int? serviceId;
  final ServicesOrderEntity? service;
  final int? categoryId;
  final String? createdAt;
  final String? installationDate;
  final String? expiresAt;

  const MyOrderDataEntity({
    this.total,
    this.createdAt,
    this.id,
    this.status,
    this.communicationDate,
    this.communicationTime,
    this.location,
    this.longitude,
    this.latitude,
    required this.description,
    this.serviceId,
    this.service,
    this.categoryId,
    this.expiresAt,
    this.installationDate,
  });

  @override
  List<Object?> get props => [
        id,
        status,
        communicationDate,
        communicationTime,
        location,
        longitude,
        latitude,
        description,
        serviceId,
        service,
        categoryId,
        createdAt,
        total,
        expiresAt,
        installationDate,
      ];
}
