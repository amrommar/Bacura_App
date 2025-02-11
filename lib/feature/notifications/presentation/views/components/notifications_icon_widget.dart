import 'package:bacura_app/core/providers/core_provider.dart';
import 'package:bacura_app/core/services/number_parser.dart';
import 'package:bacura_app/core/utils/app_sizes.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:badges/badges.dart' as badges;

class NotificationsIconWidget extends StatelessWidget {
  const NotificationsIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final coreProvider = Provider.of<CoreProvider>(context);

    return IconButton(
      icon: badges.Badge(
        showBadge: coreProvider.notificationCount > 0,
        badgeContent: Text(
          NumberParser.translateNumber(coreProvider.notificationCount.toString()),
          style: TextStyle(color: Colors.white, fontSize: AppSizes.sp12),
        ),
        badgeStyle: const badges.BadgeStyle(
          badgeColor: Colors.red,
        ),
        child: Icon(Icons.notifications, size: AppSizes.ph30),
      ),
      onPressed: () {
        Navigator.pushNamed(context, Routes.notificationsRoute);
      },
    );
  }
}
