import 'package:bacura_app/core/error/failaure.dart';
import 'package:bacura_app/core/services/usecases.dart';
import 'package:bacura_app/feature/offers/domain/repository/base_offers_repository.dart';
import 'package:dartz/dartz.dart';

class OrderOfferUseCase extends BaseUseCases<void, int> {
  BaseOffersRepository baseOffersRepository;
  OrderOfferUseCase({required this.baseOffersRepository});
  @override
  Future<Either<Failure, void>> call(int parameters) {
    return baseOffersRepository.orderOffer(id: parameters);
  }
}
