import 'package:bacura_app/feature/auth/data/models/verify_data_model.dart';
import 'package:bacura_app/feature/auth/domain/entities/verify_otp_entity.dart';

class VerifyOtpModel extends VerifyOtpEntity {
  const VerifyOtpModel({required super.data, required super.message, required super.error});

  factory VerifyOtpModel.fromMap(Map<String, dynamic> json) {
    return VerifyOtpModel(
      data: VerifyDataModel.fromJson(json['data']),
      message: json['message'],
      error: json['error'],
    );
  }
}
