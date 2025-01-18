import 'package:bacura_app/core/utils/index.dart';
import 'package:dartz/dartz.dart';

abstract class BaseAuthRepository {
  Future<Either<Failure, void>> login({required LoginParameter loginParameter});
}
