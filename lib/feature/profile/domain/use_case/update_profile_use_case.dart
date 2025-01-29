import 'package:bacura_app/core/error/failaure.dart';
import 'package:bacura_app/core/services/usecases.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/profile/domain/repository/base_profile_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class UpdateProfileUseCase extends BaseUseCases<void, UpdateProfileParameters> {
  final BaseProfileRepository baseProfileRepository;

  UpdateProfileUseCase({required this.baseProfileRepository});

  @override
  Future<Either<Failure, void>> call(UpdateProfileParameters parameters) {
    return baseProfileRepository.updateMyProfile(updateProfileParameters: parameters);
  }
}

class UpdateProfileParameters extends Equatable {
  final String? email;
  final String? phone;
  final String? gender;
  final String? name;
  final String? file;
  final String? countryCode;
  final String? location;

  const UpdateProfileParameters({this.email, this.phone, this.gender, this.name, this.file, this.countryCode, this.location});

  Map<String, dynamic> toMap() => {
        'email': email,
        'phone': phone,
        'gender': gender,
        'name': name,
        'file': file,
        'country_code': countryCode,
        'location': location,
      }..removeWhere(
          (key, value) => value == null || value.toString().isEmpty,
        );

  @override
  List<Object?> get props => [
        email,
        phone,
        gender,
        name,
        file,
        countryCode,
        location,
      ];
}
