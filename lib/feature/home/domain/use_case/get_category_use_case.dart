import 'package:bacura_app/core/services/usecases.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/home/domain/entity/Category_entity.dart';
import 'package:bacura_app/feature/home/domain/repository/base_home_repository.dart';
import 'package:dartz/dartz.dart';

class GetCategoryUseCase extends BaseUseCasesNoParam<List<CategoryEntity>> {
  BaseHomeRepository baseHomeRepository;
  GetCategoryUseCase({required this.baseHomeRepository});
  @override
  Future<Either<Failure, List<CategoryEntity>>> call() {
    return baseHomeRepository.getCategories();
  }
}
