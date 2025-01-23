import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/auth/domain/entities/verify_data_entity.dart';
import 'package:bacura_app/feature/auth/domain/usecases/complete_profile_use_case.dart';
import 'package:bacura_app/feature/auth/domain/usecases/verify_usecase.dart';
import 'package:dartz/dartz.dart';

class AuthRepository extends BaseAuthRepository {
  final BaseAuthRemoteDataSource baseAuthRemoteDataSource;

  AuthRepository({required this.baseAuthRemoteDataSource});

  @override
  Future<Either<Failure, void>> login({required LoginParameter loginParameter}) async {
    try {
      return Right(await baseAuthRemoteDataSource.login(loginParameter));
    } on Failure catch (ex) {
      return Left(ServerFailure(code: ex.code, message: ex.message));
    }
  }

  @override
  Future<Either<Failure, VerifyDataEntity>> verify({required VerifyParameter verifyParameter}) async {
    try {
      return Right(await baseAuthRemoteDataSource.verify(verifyParameter: verifyParameter));
    } on Failure catch (ex) {
      return Left(ServerFailure(code: ex.code, message: ex.message));
    }
  }

  @override
  Future<Either<Failure, void>> completeProfileData({required CompleteParameter completeParameter}) async {
    try {
      return Right(await baseAuthRemoteDataSource.completeProfileData(completeParameter));
    } on Failure catch (ex) {
      return Left(ServerFailure(code: ex.code, message: ex.message));
    }
  }
}
