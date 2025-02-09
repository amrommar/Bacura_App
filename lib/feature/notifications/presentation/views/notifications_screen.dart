import 'package:bacura_app/core/presentation/widget/shimmer.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/notifications/presentation/controller/notifications_provider.dart';

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
      body: ChangeNotifierProvider(
        create: (context) => NotificationsProvider(),
        child: Consumer<NotificationsProvider>(
          builder: (context, provider, child) => Container(
            color: ColorManager.whiteColor,
            child: provider.isLoadingNotifications
                ? buildShimmerContainer()
                : ListView.separated(
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
                                Container(
                                    width: AppSizes.pw320,
                                    padding: EdgeInsets.symmetric(vertical: AppSizes.ph8, horizontal: AppSizes.pw4),
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          ///////////////    from Back-End     /////////////////////
                                          Text(provider.notificationsEntity.notificationsDataEntity[index].title!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(color: ColorManager.darkBlueColor)),
                                          Text(provider.notificationsEntity.notificationsDataEntity[index].body!,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(color: ColorManager.greyColor))
                                        ]))
                              ])),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => Container(
                          width: AppSizes.pw430,
                          color: ColorManager.lightBlueColor,
                          height: AppSizes.ph1,
                        ),
                    itemCount: provider.notificationsEntity.totalRecords!),
          ),
        ),
      ),
    );
  }
}
