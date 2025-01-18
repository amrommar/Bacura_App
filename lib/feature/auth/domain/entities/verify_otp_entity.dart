import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/auth/domain/entities/verify_data_entity.dart';

class VerifyOtpEntity extends Equatable {
  final String? message;
  final VerifyDataEntity? data;
  final String? error;
  const VerifyOtpEntity({
    this.message,
    this.data,
    this.error,
  });

  @override
  List<Object?> get props => [message, data, error];
}
