import 'package:bacura_app/core/error/failaure.dart';

import 'package:bacura_app/feature/offers/data/data_source/offers_data_source.dart';
import 'package:bacura_app/feature/offers/domin/entity/offers_entity.dart';
import 'package:bacura_app/feature/offers/domin/repository/base_offers_repository.dart';
import 'package:bacura_app/feature/offers/domin/use_case/get_my_requests_use_case.dart';

import 'package:dartz/dartz.dart';

class OffersRepository extends BaseOffersRepository {
  BaseOffersDataSource baseRequestDataSource;

  OffersRepository({required this.baseRequestDataSource});
  @override
  Future<Either<Failure, OffersEntity>> getOffers({required OffersParameters offersParameters}) async {
    try {
      return Right(await baseRequestDataSource.getOffers(offersParameters: offersParameters));
    } on Failure catch (ex) {
      return Left(ServerFailure(code: ex.code, message: ex.message));
    }
  }
}
