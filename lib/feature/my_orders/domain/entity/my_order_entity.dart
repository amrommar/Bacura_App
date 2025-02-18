import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/my_orders/domain/entity/my_order_data_entity.dart';

class MyOrderEntity extends Equatable {
  final List<MyOrderDataEntity> myOrderDataEntity;
  final int? limit;
  final int? page;
  final int? totalRecords;
  final int? totalPages;
  final String? nextPageLink;
  final String? previousPageLink;

  const MyOrderEntity({
    required this.myOrderDataEntity,
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
