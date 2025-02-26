import 'package:bacura_app/core/services/number_parser.dart';
import 'package:bacura_app/core/utils/app_sizes.dart';
import 'package:bacura_app/core/utils/dialog_function.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/home/presentation/controller/home_provider.dart';
import 'package:bacura_app/feature/profile/presentation/controller/my_profile_provider.dart';
import 'package:badges/badges.dart' as badges;

class NotificationsIconWidget extends StatelessWidget {
  const NotificationsIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    final profileProvider = Provider.of<MyProfileProvider>(context);

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
        profileProvider.token == null
            ? customShowCustomDialog(
                context: context,
                title: 'تسجيل الدخول',
                imagePath: 'assets/images/png/bad-feedback.png',
                content: 'الرجاء تسجيل الدخول اولاً',
                isOk: true,
                isCancel: true,
                onCancel: () {
                  Navigator.pop(context);
                },
                onOk: () {
                  Navigator.pushNamed(context, Routes.loginRoute);
                },
              )
            : Navigator.pushNamed(context, Routes.notificationsRoute);
      },
    );
  }
}
