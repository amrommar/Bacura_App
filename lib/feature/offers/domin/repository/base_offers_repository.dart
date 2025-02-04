import 'package:bacura_app/core/error/failaure.dart';
import 'package:bacura_app/feature/offers/domin/entity/offers_entity.dart';
import 'package:bacura_app/feature/offers/domin/use_case/get_my_requests_use_case.dart';
import 'package:dartz/dartz.dart';

abstract class BaseOffersRepository {
  Future<Either<Failure, OffersEntity>> getOffers({required OffersParameters offersParameters});
}
