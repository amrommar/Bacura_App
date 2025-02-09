import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/notifications/domain/entity/notifications_data_entity.dart';

class NotificationsEntity extends Equatable {
  final List<NotificationsDataEntity> notificationsDataEntity;
  final int? limit;
  final int? page;
  final int? totalRecords;
  final int? totalPages;
  final String? nextPageLink;
  final String? previousPageLink;

  const NotificationsEntity({
    required this.notificationsDataEntity,
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
