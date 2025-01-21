import 'package:bacura_app/core/utils/index.dart';
import 'package:dartz/dartz.dart';

class CompleteProfileUseCase extends BaseUseCases<void, CompleteParameter> {
  final BaseAuthRepository baseAuthRepository;

  CompleteProfileUseCase({required this.baseAuthRepository});

  @override
  Future<Either<Failure, dynamic>> call(parameters) {
    return baseAuthRepository.completeProfileData(completeParameter: parameters);
  }
}

class CompleteParameter extends Equatable {
  final String fullName;
  final String email;
  final String gender;
  final String location;

  const CompleteParameter({required this.fullName, required this.email, required this.gender, required this.location});

  Map<String, dynamic> toMap() => {
        'name': fullName,
        'email': email,
        'gender': gender,
        'location': location,
      };

  @override
  List<Object?> get props => [fullName, email, gender, location];
}
