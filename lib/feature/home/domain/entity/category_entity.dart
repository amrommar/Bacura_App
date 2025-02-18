import 'package:bacura_app/core/utils/index.dart';

import 'services_home_entity.dart';

class CategoryEntity extends Equatable {
  final int? id;
  final String? name;
  final String? image;
  final String? cover;
  final int? serviceIds;
  final String? type;
  final int? action;

  final List<ServicesHomeEntity> services;
  const CategoryEntity(
      {this.cover, this.type, this.id, this.name, this.image, this.serviceIds, this.action, required this.services});

  @override
  List<Object?> get props => [id, name, image, serviceIds, action, services];
}
