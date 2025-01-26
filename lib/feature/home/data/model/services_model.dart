import 'package:bacura_app/feature/home/domain/entity/services_entity.dart';

class ServicesModel extends ServicesEntity {
  const ServicesModel({
    required super.id,
    required super.name,
    required super.isConsultation,
  });
  factory ServicesModel.fromJson(Map<String, dynamic> json) => ServicesModel(
        id: json['id'],
        name: json['name'],
        isConsultation: json['is_consultation'],
      );
}
