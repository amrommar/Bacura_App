import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/profile/domain/entity/my_profile_entity.dart';
import 'package:bacura_app/feature/profile/domain/use_case/update_profile_use_case.dart';
import 'package:dartz/dartz.dart';

abstract class BaseProfileRepository {
  Future<Either<Failure, MyProfileEntity>> getMyProfile();
  Future<Either<Failure, void>> updateMyProfile({required UpdateProfileParameters updateProfileParameters});
}
