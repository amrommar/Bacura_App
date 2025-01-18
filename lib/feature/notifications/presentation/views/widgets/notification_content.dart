import 'package:bacura_app/core/utils/index.dart';

class NotificationContent extends StatelessWidget {
  const NotificationContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 320.w,
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ///////////////    from Back-End     /////////////////////
              Text('عنوان الاشعار',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.darkBlueColor)),
              Text('وصف الاشعار وصف الاشعار وصف الاشعار وصف الاشعار وصف الاشعار وصف الاشعار',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorManager.greyColor))
            ]));
  }
}
