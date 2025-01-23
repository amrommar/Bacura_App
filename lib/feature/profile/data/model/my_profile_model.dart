import 'package:bacura_app/feature/profile/domain/entity/my_profile_entity.dart';

class MyProfileModel extends MyProfileEntity {
  const MyProfileModel({
    required super.id,
    required super.email,
    required super.password,
    required super.roleId,
    required super.phone,
    required super.name,
    required super.gender,
    required super.location,
    required super.image,
    required super.countryCode,
  });
  factory MyProfileModel.fromJson(Map<String, dynamic> json) => MyProfileModel(
        id: json['id'],
        email: json['email'],
        password: json['password'],
        roleId: json['role_id'],
        phone: json['phone'],
        name: json['name'],
        gender: json['gender'],
        location: json['location'],
        image: json['image'],
        countryCode: json['country_code'],
      );
}
