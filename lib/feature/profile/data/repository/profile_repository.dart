import 'package:bacura_app/core/error/failaure.dart';
import 'package:bacura_app/feature/profile/data/data_source/profile_data_source.dart';
import 'package:bacura_app/feature/profile/domain/repository/base_profile_repository.dart';
import 'package:bacura_app/feature/auth/domain/usecases/complete_profile_use_case.dart';
import 'package:dartz/dartz.dart';

class ProfileRepository extends BaseProfileRepository {
  final BaseProfileDataSource baseProfileDataSource;

  ProfileRepository({required this.baseProfileDataSource});
}
