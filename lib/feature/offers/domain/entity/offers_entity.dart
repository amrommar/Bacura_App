import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/offers/domain/entity/offers_data_entity.dart';

class OffersEntity extends Equatable {
  final List<OffersDataEntity> offersDataEntity;
  final int? limit;
  final int? page;
  final int? totalRecords;
  final int? totalPages;
  final String? nextPageLink;
  final String? previousPageLink;

  const OffersEntity({
    required this.offersDataEntity,
    required this.limit,
    required this.page,
    required this.totalRecords,
    required this.totalPages,
    required this.nextPageLink,
    required this.previousPageLink,
  });

  @override
  List<Object?> get props => [limit, page, totalRecords, totalPages, nextPageLink, previousPageLink];
}
