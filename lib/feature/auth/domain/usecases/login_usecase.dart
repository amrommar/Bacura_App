import 'package:bacura_app/core/utils/index.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase extends BaseUseCases<void, LoginParameter> {
  final BaseAuthRepository baseAuthRepository;

  LoginUseCase({required this.baseAuthRepository});

  @override
  Future<Either<Failure, void>> call(LoginParameter parameters) {
    return baseAuthRepository.login(loginParameter: parameters);
  }
}

class LoginParameter extends Equatable {
  final String phone;
  final String countryCode;

  const LoginParameter({
    required this.phone,
    required this.countryCode,
  });

  Map<String, dynamic> toMap() => {
        'phone': phone,
        'country_code': countryCode,
      };

  @override
  List<Object?> get props => [
        phone,
        countryCode,
      ];
}
