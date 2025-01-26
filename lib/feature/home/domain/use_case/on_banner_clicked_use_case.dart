import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/home/domain/repository/base_home_repository.dart';
import 'package:dartz/dartz.dart';

class OnBannerClickedUseCase extends BaseUseCases<void, int> {
  BaseHomeRepository baseHomeRepository;
  OnBannerClickedUseCase({required this.baseHomeRepository});
  @override
  Future<Either<Failure, dynamic>> call(parameters) async {
    return await baseHomeRepository.onBannerClicked(id: parameters);
  }
}
