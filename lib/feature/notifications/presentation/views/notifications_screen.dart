import 'package:bacura_app/core/utils/index.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.notifications)),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
                height: 80.h,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(children: [
                  const NotificationImageWidget(),
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      child: VerticalDivider(color: ColorManager.soLightGreyColor)),
                  const NotificationContentWidget()
                ]));
          },
          separatorBuilder: (context, index) =>
              Container(width: 430.w, color: ColorManager.lightBlueColor, height: 1.h),
          itemCount: 15),
    );
  }
}
