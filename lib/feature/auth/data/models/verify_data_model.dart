import 'package:bacura_app/feature/auth/domain/entities/verify_data_entity.dart';

class VerifyDataModel extends VerifyDataEntity {
  const VerifyDataModel({
    required super.token,
    required super.countryCode,
    required super.phone,
    required super.isCompleted,
    required super.otp,
    required super.role,
  });
  factory VerifyDataModel.fromJson(Map<String, dynamic> json) => VerifyDataModel(
        token: json['token'],
        countryCode: json['country_code'],
        phone: json['phone'],
        isCompleted: json['is_completed'],
        otp: json['otp'],
        role: json['role'],
      );
}
