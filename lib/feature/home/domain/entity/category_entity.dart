import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/home/domain/entity/services_entity.dart';

class CategoryEntity extends Equatable {
  final int? id;
  final String? name;
  final String? image;
  final int? serviceIds;
  final int? action;
  final List<ServicesEntity>? services;
  const CategoryEntity({this.id, this.name, this.image, this.serviceIds, this.action, this.services});

  @override
  List<Object?> get props => [id, name, image, serviceIds, action, services];
}
