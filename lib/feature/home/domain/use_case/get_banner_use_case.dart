import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/home/domain/entity/banner_entity.dart';
import 'package:bacura_app/feature/home/domain/repository/base_home_repository.dart';
import 'package:dartz/dartz.dart';

class GetBannerUseCase extends BaseUseCasesNoParam<List<BannerEntity>> {
  BaseHomeRepository baseHomeRepository;

  GetBannerUseCase({required this.baseHomeRepository});

  @override
  Future<Either<Failure, List<BannerEntity>>> call() async {
    return await baseHomeRepository.getBanner();
  }
}
