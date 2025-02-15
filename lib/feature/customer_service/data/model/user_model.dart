import 'package:bacura_app/feature/customer_service/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.image,
    required super.phone,
    required super.countryCode,
    required super.createdAt,
    required super.gender,
    required super.location,
    required super.isActive,
    required super.password,
    required super.roleId,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      image: json['image'],
      phone: json['phone'],
      countryCode: json['country_code'],
      createdAt: json['created_at'],
      gender: json['gender'],
      location: json['location'],
      isActive: json['is_active'],
      password: json['password'],
      roleId: json['role_id'],
    );
  }
}
