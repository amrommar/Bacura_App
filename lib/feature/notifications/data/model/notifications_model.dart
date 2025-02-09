import 'package:bacura_app/feature/notifications/data/model/notifications_data_model.dart';
import 'package:bacura_app/feature/notifications/domain/entity/notifications_entity.dart';

class NotificationsModel extends NotificationsEntity {
  const NotificationsModel({
    required super.notificationsDataEntity,
    required super.limit,
    required super.page,
    required super.totalRecords,
    required super.totalPages,
    required super.nextPageLink,
    required super.previousPageLink,
  });

  factory NotificationsModel.fromJson(Map<String, dynamic> json) => NotificationsModel(
        notificationsDataEntity:
            (json["data"] as List<dynamic>?)?.map((item) => NotificationsDataModel.fromJson(item)).toList() ?? [],
        limit: json["limit"] ?? 0,
        page: json["page"] ?? 0,
        totalRecords: json["total_records"] ?? 0,
        totalPages: json["total_pages"] ?? 0,
        nextPageLink: json["next_page_link"] ?? "",
        previousPageLink: json["previous_page_link"] ?? "",
      );
}
