import 'package:bacura_app/core/error/failaure.dart';
import 'package:bacura_app/feature/profile/data/data_source/profile_data_source.dart';
import 'package:bacura_app/feature/profile/domain/entity/my_profile_entity.dart';
import 'package:bacura_app/feature/profile/domain/repository/base_profile_repository.dart';
import 'package:bacura_app/feature/profile/domain/use_case/update_profile_use_case.dart';
import 'package:dartz/dartz.dart';

class ProfileRepository extends BaseProfileRepository {
  final BaseProfileDataSource baseProfileDataSource;

  ProfileRepository({required this.baseProfileDataSource});

  @override
  Future<Either<Failure, MyProfileEntity>> getMyProfile() async {
    try {
      return Right(await baseProfileDataSource.getMyProfile());
    } on Failure catch (ex) {
      return Left(ServerFailure(code: ex.code, message: ex.message));
    }
  }

  @override
  Future<Either<Failure, void>> updateMyProfile({required UpdateProfileParameters updateProfileParameters}) async {
    try {
      return Right(await baseProfileDataSource.updateMyProfile(updateProfileParameters: updateProfileParameters));
    } on Failure catch (ex) {
      return Left(ServerFailure(code: ex.code, message: ex.message));
    }
  }
}
