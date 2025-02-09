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

  NotificationsEntity copyWith({
    List<NotificationsDataEntity>? notificationsDataEntity,
    int? limit,
    int? page,
    int? totalRecords,
    int? totalPages,
    String? nextPageLink,
    String? previousPageLink,
  }) {
    return NotificationsEntity(
      notificationsDataEntity: notificationsDataEntity ?? this.notificationsDataEntity,
      limit: limit ?? this.limit,
      page: page ?? this.page,
      totalRecords: totalRecords ?? this.totalRecords,
      totalPages: totalPages ?? this.totalPages,
      nextPageLink: nextPageLink ?? this.nextPageLink,
      previousPageLink: previousPageLink ?? this.previousPageLink,
    );
  }

  @override
  List<Object?> get props =>
      [notificationsDataEntity, limit, page, totalRecords, totalPages, nextPageLink, previousPageLink];
}
