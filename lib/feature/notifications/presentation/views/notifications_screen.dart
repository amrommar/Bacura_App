import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/notifications/presentation/controller/notifications_provider.dart';
import 'package:bacura_app/feature/notifications/presentation/views/components/notification_item_component.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:shimmer/shimmer.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.notifications),
      ),
      body: ChangeNotifierProvider(
        create: (context) => NotificationsProvider(),
        child: Consumer<NotificationsProvider>(
          builder: (context, provider, child) => provider.isLoadingNotifications
              ? buildNotificationsShimmerContainer()
              : Column(
                  children: [
                    LazyLoadScrollView(
                      onEndOfPage: () {
                        provider.loadMoreNotifications();
                      },
                      child: Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) => Container(
                            width: AppSizes.pw430,
                            color: ColorManager.lightBlueColor,
                            height: AppSizes.ph1,
                          ),
                          itemCount: provider.notificationsEntity.notificationsDataEntity.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                provider.readNotification(
                                    notificationId: provider.notificationsEntity.notificationsDataEntity[index].id!);
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: AppSizes.pw4),
                                child: NotificationItemComponent(
                                  title: provider.notificationsEntity.notificationsDataEntity[index].title!,
                                  body: provider.notificationsEntity.notificationsDataEntity[index].body!,
                                  isRead: provider.notificationsEntity.notificationsDataEntity[index].isRead!,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    provider.isLoadingMore
                        ? Padding(
                            padding: EdgeInsets.all(AppSizes.ph10),
                            child: const Center(child: CircularProgressIndicator()),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
        ),
      ),
    );
  }
}

Widget buildNotificationsShimmerContainer() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppSizes.br12),
            ),
            margin: EdgeInsets.only(right: AppSizes.pw18, top: AppSizes.ph18, left: AppSizes.pw18),
            padding: EdgeInsets.symmetric(horizontal: AppSizes.pw12, vertical: AppSizes.ph12),
            height: AppSizes.ph80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(height: 16, width: AppSizes.pw400, color: Colors.white),
              ],
            ),
          ),
        );
      },
    ),
  );
}
