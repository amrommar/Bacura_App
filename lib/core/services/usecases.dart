import 'package:bacura_app/core/utils/index.dart';
import 'package:dartz/dartz.dart';

abstract class BaseUseCases<T, Parameters> {
  Future<Either<Failure, T>> call(Parameters parameters);
}

abstract class BaseUseCasesNoParam<T> {
  Future<Either<Failure, T>> call();
}
