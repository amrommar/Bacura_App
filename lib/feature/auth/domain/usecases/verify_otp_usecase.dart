import 'package:bacura_app/core/utils/index.dart';
import 'package:dartz/dartz.dart';

class VerifyOTPUseCase extends BaseUseCases<VerifyOtpEntity, VerifyParameter> {
  final BaseVerifyRepository baseVerifyRepository;

  VerifyOTPUseCase({required this.baseVerifyRepository});

  @override
  Future<Either<Failure, VerifyOtpEntity>> call(VerifyParameter parameters) {
    return baseVerifyRepository.verify(verifyParameter: parameters);
  }
}

class VerifyParameter extends Equatable {
  final String phone;
  final String countryCode;
  final String otp;

  const VerifyParameter({
    required this.phone,
    required this.countryCode,
    required this.otp,
  });

  Map<String, dynamic> toMap() => {
        'phone': phone,
        'country_code': countryCode,
        'otp': otp,
      };

  @override
  List<Object?> get props => [
        phone,
        countryCode,
        otp,
      ];
}
