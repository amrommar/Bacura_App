import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/auth/domain/usecases/verify_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class BaseAuthRepository {
  Future<Either<Failure, void>> login({required LoginParameter loginParameter});

  Future<Either<Failure, VerifyOtpEntity>> verify({required VerifyParameter verifyParameter});
}
