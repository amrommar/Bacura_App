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
  NotificationsDataEntity copyWith({
    int? id,
    String? title,
    String? body,
    bool? isRead,
    String? resource,
    int? resourceId,
    String? createdAt,
  }) {
    return NotificationsDataEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      isRead: isRead ?? this.isRead,
      resource: resource ?? this.resource,
      resourceId: resourceId ?? this.resourceId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

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
