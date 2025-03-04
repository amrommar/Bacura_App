import 'package:bacura_app/core/services/number_parser.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/home/presentation/controller/home_provider.dart';
import 'package:badges/badges.dart' as badges;

class SpNotificationsIconWidget extends StatelessWidget {
  const SpNotificationsIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return IconButton(
      icon: badges.Badge(
        showBadge: homeProvider.notificationCount > 0,
        badgeContent: Text(
          NumberParser.translateNumber(homeProvider.notificationCount.toString()),
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
