import 'package:bacura_app/core/utils/index.dart';

class NotificationsDataEntity extends Equatable {
  final int? id;
  final String? title;
  final String? body;
  final bool? isRead;
  final String? resource;
  final int? resourceId;
  final String? createdAt;

  const NotificationsDataEntity({
    this.id,
    this.title,
    this.body,
    this.isRead,
    this.resource,
    this.resourceId,
    this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        body,
        isRead,
        resource,
        resourceId,
        createdAt,
      ];
}
