import 'package:bacura_app/feature/auth/data/models/verify_data_model.dart';
import 'package:bacura_app/feature/auth/domain/entities/verify_otp_entity.dart';

class VerifyOtpModel extends VerifyOtpEntity {
  const VerifyOtpModel({super.data, required super.message, super.error});

  factory VerifyOtpModel.fromMap(Map<String, dynamic> json) {
    return VerifyOtpModel(
      data: json['data'] != null ? VerifyDataModel.fromJson(json['data']) : null,
      message: json['message'] ?? '',
      error: json['error'] ?? '',
    );
  }
}
