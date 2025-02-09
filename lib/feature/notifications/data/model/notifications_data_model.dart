import 'package:bacura_app/feature/notifications/domain/entity/notifications_data_entity.dart';

class NotificationsDataModel extends NotificationsDataEntity {
  const NotificationsDataModel({
    required super.id,
    required super.title,
    required super.body,
    required super.isRead,
    required super.resource,
    required super.resourceId,
    required super.createdAt,
  });

  factory NotificationsDataModel.fromJson(Map<String, dynamic> json) => NotificationsDataModel(
        id: json["id"] ?? 0,
        title: json["title"] ?? "",
        body: json["body"] ?? 0,
        isRead: json["is_read"],
        resource: json["resource"] ?? 0,
        resourceId: json["resource_id"] ?? "",
        createdAt: json["created_at"] ?? "",
      );
}
