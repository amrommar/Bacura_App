import 'package:bacura_app/core/utils/index.dart';

class NotificationContentWidget extends StatelessWidget {
  const NotificationContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: AppSizes.pw320,
        padding: EdgeInsets.symmetric(vertical: AppSizes.ph8, horizontal: AppSizes.pw4),
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
