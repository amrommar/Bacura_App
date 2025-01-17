import 'package:bacura_app/core/error/failaure.dart';
import 'package:bacura_app/feature/auth/data/DataSource/auth_remote_data_source.dart';
import 'package:bacura_app/feature/auth/domain/Repositories/base_auth_repository.dart';
import 'package:bacura_app/feature/auth/domain/usecases/login_usecase.dart';
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
}
