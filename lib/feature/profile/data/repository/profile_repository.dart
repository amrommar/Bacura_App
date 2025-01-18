import 'package:bacura_app/core/error/failaure.dart';
import 'package:bacura_app/feature/profile/data/data_source/profile_data_source.dart';
import 'package:bacura_app/feature/profile/domain/repository/base_profile_repository.dart';
import 'package:bacura_app/feature/profile/domain/use_case/complete_profile_use_case.dart';
import 'package:dartz/dartz.dart';

class ProfileRepository extends BaseProfileRepository {
  final BaseProfileDataSource baseProfileDataSource;

  ProfileRepository({required this.baseProfileDataSource});

  @override
  Future<Either<Failure, void>> completeProfileData({required CompleteParameter completeParameter}) async {
    try {
      return Right(await baseProfileDataSource.completeProfileData(completeParameter));
    } on Failure catch (ex) {
      return Left(ServerFailure(code: ex.code, message: ex.message));
    }
  }
}
