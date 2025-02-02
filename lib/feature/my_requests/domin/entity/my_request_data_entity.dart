import 'package:bacura_app/core/utils/index.dart';

class MyRequestDataEntity extends Equatable {
  final int? id;
  final String? status;
  final String? communicationDate;
  final String? communicationTime;
  final String? location;
  final double? longitude;
  final double? latitude;
  final String description;
  final int? serviceId;
  final String? service;
  final int? categoryId;

  const MyRequestDataEntity({
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
  });

  @override
  List<Object?> get props => [id, status, communicationDate, communicationTime, location, longitude, latitude, description, serviceId, service, categoryId];
}
