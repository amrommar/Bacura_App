import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/profile/domain/use_case/complete_profile_use_case.dart';
import 'package:dartz/dartz.dart';

abstract class BaseProfileRepository {
  Future<Either<Failure, void>> completeProfileData({required CompleteParameter completeParameter});
}
