import 'package:bacura_app/core/error/failaure.dart';
import 'package:bacura_app/core/services/usecases.dart';
import 'package:bacura_app/feature/profile/domain/entity/my_profile_entity.dart';
import 'package:bacura_app/feature/profile/domain/repository/base_profile_repository.dart';
import 'package:dartz/dartz.dart';

class MyProfileUseCase extends BaseUseCasesNoParam<MyProfileEntity> {
  final BaseProfileRepository baseProfileRepository;

  MyProfileUseCase({required this.baseProfileRepository});
  @override
  Future<Either<Failure, MyProfileEntity>> call() async {
    return await baseProfileRepository.getMyProfile();
  }
}
