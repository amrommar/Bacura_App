import 'package:bacura_app/feature/home/data/model/services_model.dart';
import 'package:bacura_app/feature/home/domain/entity/Category_entity.dart';
import 'package:bacura_app/feature/home/domain/entity/services_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.id,
    required super.name,
    required super.image,
    required super.serviceIds,
    required super.action,
    required super.services,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      serviceIds: json['service_ids'],
      action: json['action'],
      services: json['services'] == null
          ? []
          : List<ServicesEntity>.from(
              json['services'].map(
                (e) => ServicesModel.fromJson(e),
              ),
            ),
    );
  }
}
