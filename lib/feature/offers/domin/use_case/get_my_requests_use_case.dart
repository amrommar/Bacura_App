import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/offers/domin/entity/offers_entity.dart';
import 'package:bacura_app/feature/offers/domin/repository/base_offers_repository.dart';
import 'package:dartz/dartz.dart';

class GetOffersUseCase extends BaseUseCases<OffersEntity, OffersParameters> {
  BaseOffersRepository baseOffersRepository;

  GetOffersUseCase({required this.baseOffersRepository});
  @override
  Future<Either<Failure, OffersEntity>> call(parameters) async {
    return await baseOffersRepository.getOffers(offersParameters: parameters);
  }
}

class OffersParameters extends Equatable {
  final int page;
  final int limit;
  final int? serviceId;
  final int? categoryId;

  const OffersParameters({this.page = 1, this.limit = 1000, this.serviceId, this.categoryId});

  Map<String, dynamic> toMap() => {
        "page": page,
        "limit": limit,
        'service_id': serviceId,
        'category_id': categoryId,
      };

  @override
  List<Object?> get props => [page, limit];
}
