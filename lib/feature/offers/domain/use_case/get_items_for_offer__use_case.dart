import 'package:bacura_app/core/error/failaure.dart';
import 'package:bacura_app/core/services/usecases.dart';
import 'package:bacura_app/feature/offers/domain/entity/items_offer_entity.dart';
import 'package:bacura_app/feature/offers/domain/repository/base_offers_repository.dart';
import 'package:dartz/dartz.dart';

class GetItemsForOfferUseCase extends BaseUseCases<List<ItemsOfferEntity>, int> {
  BaseOffersRepository baseOffersRepository;
  GetItemsForOfferUseCase({required this.baseOffersRepository});
  @override
  Future<Either<Failure, List<ItemsOfferEntity>>> call(int parameters) {
    return baseOffersRepository.getItems(id: parameters);
  }
}
