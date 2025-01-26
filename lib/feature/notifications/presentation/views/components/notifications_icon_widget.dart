import 'package:bacura_app/core/utils/index.dart';

class NotificationsIconWidget extends StatelessWidget {
  const NotificationsIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.notifications, size: AppSizes.ph30),
        onPressed: () {
          Navigator.pushNamed(context, Routes.notificationsRoute);
        });
  }
}
