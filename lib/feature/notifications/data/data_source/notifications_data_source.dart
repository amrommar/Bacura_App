import 'package:bacura_app/core/network/model/api_client.dart';
import 'package:bacura_app/core/network/model/api_endpoint.dart';
import 'package:bacura_app/feature/notifications/data/model/notifications_model.dart';
import 'package:bacura_app/feature/notifications/domain/entity/notifications_entity.dart';
import 'package:bacura_app/feature/notifications/domain/use_case/get_my_notifications_use_case.dart';

abstract class BaseNotificationsDataSource {
  Future<NotificationsEntity> getNotifications({required NotificationsParameters notificationsParameters});
  Future<void> readNotification({required int notificationId});
  Future<int> unreadNotification();
}

class NotificationsDataSource extends BaseNotificationsDataSource {
  @override
  Future<NotificationsEntity> getNotifications({required NotificationsParameters notificationsParameters}) async {
    try {
      final response = await ApiClient().apiCall(
        requestType: RequestType.GET,
        url: ApiEndPoint.notificationsPath,
        queryParameters: notificationsParameters.toMap(),
      );

      if (response != null) {
        final data = response.data;

        if (data is Map<String, dynamic>) {
          return NotificationsModel.fromJson(data);
        } else {
          throw Exception("Invalid API response format: Expected Map<String, dynamic>");
        }
      } else {
        throw Exception("API response is null");
      }
    } catch (e) {
      throw Exception("Error fetching data: $e");
    }
  }

  @override
  Future<void> readNotification({required int notificationId}) async {
    await ApiClient().apiCall(
      requestType: RequestType.GET,
      url: 'notifications/$notificationId/read',
    );
  }

  @override
  Future<int> unreadNotification() async {
    var response = await ApiClient().apiCall(
      requestType: RequestType.GET,
      url: ApiEndPoint.unViewed,
    );
    return response!.data;
  }
}
