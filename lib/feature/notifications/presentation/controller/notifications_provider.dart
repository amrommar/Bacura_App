import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/notifications/domain/entity/notifications_data_entity.dart';
import 'package:bacura_app/feature/notifications/domain/entity/notifications_entity.dart';
import 'package:bacura_app/feature/notifications/domain/use_case/get_my_notifications_use_case.dart';
import 'package:bacura_app/feature/notifications/domain/use_case/read_notification_use_case.dart';

class NotificationsProvider with ChangeNotifier {
  NotificationsEntity notificationsEntity = const NotificationsEntity(
    notificationsDataEntity: [],
    limit: 10,
    page: 1,
    totalRecords: 0,
    totalPages: 0,
    nextPageLink: null,
    previousPageLink: null,
  );
  bool isLoadingMore = false;
  bool isFinishedPaging = false;
  bool isLoadingNotifications = true;
  int pageNumber = 1;

  NotificationsProvider() {
    init();
  }

  init() async {
    await getNotifications();
  }

  Future<void> getNotifications({bool isLoadingMore = false}) async {
    this.isLoadingMore = isLoadingMore;
    notifyListeners();

    final result = await sl<GetNotificationsUseCase>()(
      NotificationsParameters(
        page: pageNumber,
        limit: AppConstants.defaultPageSize,
      ),
    );

    result.fold((l) async {
      //! handle in error
    }, (r) {
      if (r.notificationsDataEntity.isEmpty) {
        isFinishedPaging = true;
      } else {
        if (isLoadingMore) {
          notificationsEntity = notificationsEntity.copyWith(
            notificationsDataEntity: [
              ...notificationsEntity.notificationsDataEntity,
              ...r.notificationsDataEntity,
            ],
          );
        } else {
          notificationsEntity = r;
        }
      }
      isLoadingNotifications = false;
      this.isLoadingMore = false;
      notifyListeners();
    });
  }

  loadMoreNotifications() async {
    if (isFinishedPaging) return;
    pageNumber++;
    isLoadingMore = true;
    notifyListeners();
    await getNotifications(isLoadingMore: true);
    isLoadingMore = false;
    notifyListeners();
  }

  // Future<void> readNotification({required int notificationId}) async {
  //   await sl<ReadNotificationUseCase>()(notificationId);
  //   pageNumber = 1;
  //   isFinishedPaging = false;
  //   await getNotifications();
  //   notifyListeners();
  // }
  Future<void> readNotification({required int notificationId}) async {
    final index = notificationsEntity.notificationsDataEntity.indexWhere(
      (n) => n.id == notificationId,
    );

    if (index == -1 || notificationsEntity.notificationsDataEntity[index].isRead!) return;

    final result = await sl<ReadNotificationUseCase>()(notificationId);

    result.fold(
      (l) {},
      (r) {
        final updatedNotification = notificationsEntity.notificationsDataEntity[index].copyWith(isRead: true);

        final updatedNotifications = List.from(notificationsEntity.notificationsDataEntity)
          ..[index] = updatedNotification;

        notificationsEntity = notificationsEntity.copyWith(
          notificationsDataEntity: List<NotificationsDataEntity>.from(updatedNotifications),
        );
        notifyListeners();
      },
    );
  }
}
