import 'package:bacura_app/core/utils/index.dart';

class NotificationsIcon extends StatelessWidget {
  const NotificationsIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.notifications, size: 30.h),
        onPressed: () {
          Navigator.pushNamed(context, Routes.notificationsRoute);
        });
  }
}
