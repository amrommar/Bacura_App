import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/my_orders/domin/entity/my_request_data_entity.dart';

class MyRequestEntity extends Equatable {
  final List<MyRequestDataEntity> myRequestDataEntity;
  final int? limit;
  final int? page;
  final int? totalRecords;
  final int? totalPages;
  final String? nextPageLink;
  final String? previousPageLink;
  const MyRequestEntity({
    required this.myRequestDataEntity,
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
