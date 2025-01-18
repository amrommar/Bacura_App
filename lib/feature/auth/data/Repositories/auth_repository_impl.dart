import 'package:bacura_app/core/utils/index.dart';
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
