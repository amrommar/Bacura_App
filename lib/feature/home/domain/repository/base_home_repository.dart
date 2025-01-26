import 'package:bacura_app/core/error/failaure.dart';
import 'package:bacura_app/feature/home/domain/entity/Category_entity.dart';
import 'package:bacura_app/feature/home/domain/entity/banner_entity.dart';
import 'package:dartz/dartz.dart';

abstract class BaseHomeRepository {
  Future<Either<Failure, List<BannerEntity>>> getBanner();
  Future<Either<Failure, void>> onBannerClicked({required int id});
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
}
