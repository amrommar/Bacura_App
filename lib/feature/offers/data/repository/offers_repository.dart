import 'package:bacura_app/core/error/failaure.dart';
import 'package:bacura_app/feature/offers/data/data_source/offers_data_source.dart';
import 'package:bacura_app/feature/offers/domain/entity/offers_entity.dart';
import 'package:bacura_app/feature/offers/domain/repository/base_offers_repository.dart';
import 'package:bacura_app/feature/offers/domain/use_case/get_my_offers_use_case.dart';
import 'package:dartz/dartz.dart';

class OffersRepository extends BaseOffersRepository {
  BaseOffersDataSource baseoffersDataSource;

  OffersRepository({required this.baseoffersDataSource});

  @override
  Future<Either<Failure, OffersEntity>> getOffers({required OffersParameters offersParameters}) async {
    try {
      return Right(await baseoffersDataSource.getOffers(offersParameters: offersParameters));
    } on Failure catch (ex) {
      return Left(ServerFailure(code: ex.code, message: ex.message));
    }
  }
}
