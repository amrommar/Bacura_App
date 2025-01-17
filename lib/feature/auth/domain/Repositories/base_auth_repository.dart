import 'package:bacura_app/core/error/failaure.dart';
import 'package:bacura_app/feature/auth/domain/usecases/login_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class BaseAuthRepository {
  Future<Either<Failure, void>> login({required LoginParameter loginParameter});
}
