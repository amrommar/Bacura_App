import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/notifications/domain/entity/notifications_entity.dart';
import 'package:bacura_app/feature/notifications/domain/use_case/get_my_notifications_use_case.dart';

class NotificationsProvider with ChangeNotifier {
  late NotificationsEntity notificationsEntity;
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
    (await sl<GetNotificationsUseCase>()(
      NotificationsParameters(page: pageNumber, limit: AppConstants.defaultPageSize),
    ))
        .fold((l) async {
      //! handle in error
    }, (r) {
      if (r.notificationsDataEntity.isEmpty) {
        isFinishedPaging = true;
        isLoadingNotifications = false;
        notifyListeners();
      } else if (isLoadingMore) {
        notificationsEntity.notificationsDataEntity.addAll(r.notificationsDataEntity);
        this.isLoadingMore = false;
        notifyListeners();
      } else {
        notificationsEntity = r;
        isLoadingNotifications = false;
        notifyListeners();
      }
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
}
