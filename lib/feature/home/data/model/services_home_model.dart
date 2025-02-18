import 'package:bacura_app/feature/home/domain/entity/services_home_entity.dart';

class ServicesHomeModel extends ServicesHomeEntity {
  const ServicesHomeModel({
    required super.id,
    required super.name,
    required super.isConsultation,
  });
  factory ServicesHomeModel.fromJson(Map<String, dynamic> json) => ServicesHomeModel(
        id: json['id'],
        name: json['name'],
        isConsultation: json['is_consultation'],
      );
}
