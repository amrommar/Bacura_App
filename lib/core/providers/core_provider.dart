import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/notifications/domain/use_case/get_unread_notifications_use_case.dart';

class CoreProvider with ChangeNotifier {
  int notificationCount = 0;

  CoreProvider() {
    getNotificationCount();
  }

  getNotificationCount() async {
    var res = await sl<GetUnreadNotificationsUseCase>().call();

    res.fold((l) => null, (r) {
      notificationCount = r;
      notifyListeners();
    });
  }
}
