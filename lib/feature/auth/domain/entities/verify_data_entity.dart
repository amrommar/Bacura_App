import 'package:bacura_app/core/utils/index.dart';

class VerifyDataEntity extends Equatable {
  final String? token;
  final String? countryCode;
  final String? phone;
  final bool? isCompleted;
  final String? otp;
  final String? role;

  const VerifyDataEntity({this.token, this.countryCode, this.phone, this.isCompleted, this.otp, this.role});

  @override
  List<Object?> get props => [token, countryCode, phone, isCompleted, otp, role];
}
