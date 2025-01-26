import 'package:bacura_app/core/error/failaure.dart';
import 'package:bacura_app/feature/home/data/data_source/home_data_source.dart';
import 'package:bacura_app/feature/home/domain/entity/Category_entity.dart';
import 'package:bacura_app/feature/home/domain/entity/banner_entity.dart';
import 'package:bacura_app/feature/home/domain/repository/base_home_repository.dart';
import 'package:dartz/dartz.dart';

class HomeRepository extends BaseHomeRepository {
  BaseHomeDataSource baseHomeDataSource;

  HomeRepository({required this.baseHomeDataSource});
  @override
  Future<Either<Failure, List<BannerEntity>>> getBanner() async {
    try {
      return Right(await baseHomeDataSource.getBanner());
    } on Failure catch (ex) {
      return Left(ServerFailure(code: ex.code, message: ex.message));
    }
  }

  @override
  Future<Either<Failure, void>> onBannerClicked({required int id}) async {
    try {
      return Right(await baseHomeDataSource.onBannerClicked(id: id.toString()));
    } on Failure catch (ex) {
      return Left(ServerFailure(code: ex.code, message: ex.message));
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      return Right(await baseHomeDataSource.getCategories());
    } on Failure catch (ex) {
      return Left(ServerFailure(code: ex.code, message: ex.message));
    }
  }
}
