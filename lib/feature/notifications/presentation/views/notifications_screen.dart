import 'package:bacura_app/core/utils/index.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.notifications),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                    color: ColorManager.whiteColor,
                    height: AppSizes.ph80,
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.pw10),
                    child: Row(children: [
                      const NotificationImageWidget(),
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: AppSizes.ph15),
                          child: VerticalDivider(color: ColorManager.soLightGreyColor)),
                      NotificationContentWidget()
                    ])),
                Container(
                    color: ColorManager.lightBlueColor,
                    height: AppSizes.ph80,
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.pw10),
                    child: Row(children: [
                      const NotificationImageWidget(),
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: AppSizes.ph15),
                          child: VerticalDivider(color: ColorManager.soLightGreyColor)),
                      NotificationContentWidget(
                        title: 'لقد تم استلام طلبك',
                        description:
                            '''طلبك تحت المعالجة الآن، وفرقنا تعمل عليه بكل اهتمام. بإمكانك متابعة حالة الطلب من خلال صفحة الطلبات.
شكرًا لثقتك بنا، ونسعد بخدمتك دائمًا!''',
                      )
                    ])),
              ],
            );
          },
          separatorBuilder: (context, index) => Container(
                width: AppSizes.pw430,
                color: ColorManager.lightBlueColor,
                height: AppSizes.ph1,
              ),
          itemCount: 15),
    );
  }
}
