import 'package:bacura_app/core/error/failaure.dart';
import 'package:bacura_app/feature/offers/domain/entity/items_offer_entity.dart';
import 'package:bacura_app/feature/offers/domain/entity/offers_entity.dart';
import 'package:bacura_app/feature/offers/domain/use_case/get_my_offers_use_case.dart';
import 'package:dartz/dartz.dart';

abstract class BaseOffersRepository {
  Future<Either<Failure, OffersEntity>> getOffers({required OffersParameters offersParameters});
  Future<Either<Failure, List<ItemsOfferEntity>>> getItems({required int id});
  Future<Either<Failure, void>> orderOffer({required int id});
}
