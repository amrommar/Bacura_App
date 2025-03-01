import 'package:bacura_app/core/presentation/widget/shimmer.dart';
import 'package:bacura_app/core/services/date_parser.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/home/presentation/widgets/app_bar_profile_image_widget.dart';
import 'package:bacura_app/feature/my_orders/presentation/controller/my_order_provider.dart';
import 'package:bacura_app/feature/profile/presentation/controller/my_profile_provider.dart';
import 'package:bacura_app/feature/technician_app/index.dart';

class SpHomeScreen extends StatefulWidget {
  @override
  State<SpHomeScreen> createState() => _SpHomeScreenState();
}

class _SpHomeScreenState extends State<SpHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<MyProfileProvider>(context, listen: false);
    profileProvider.loadToken();

    return Scaffold(
      appBar: AppBar(
          titleSpacing: 5,
          centerTitle: false,
          title: Consumer<MyProfileProvider>(
            builder: (context, profileProvider, child) {
              if (profileProvider.token == null) {
                return const SizedBox.shrink();
              }
              return Text(
                'هلا، ${profileProvider.myProfileEntity.name ?? 'مستخدم'}',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: ColorManager.whiteColor,
                    ),
              );
            },
          ),
          elevation: 0,
          leading: const AppBarProfileImageWidget(imagePath: AppAssets.bacuraImage),
          actions: [
            const NotificationsIconWidget(),
            SizedBox(width: AppSizes.pw5),
          ]),
      body: ChangeNotifierProvider(
        create: (context) => MyOrderProvider(),
        child: Consumer<MyOrderProvider>(builder: (context, provider, child) {
          return provider.isLoadingMyOrders
              ? buildShimmerContainer()
              : provider.myOrderEntity.myOrderDataEntity.isEmpty
                  ? const Center(child: Text('لا يوجد طلبات'))
                  : Column(children: [
                      Expanded(
                        child: RefreshIndicator(
                          color: ColorManager.primaryBlueColor,
                          backgroundColor: ColorManager.whiteColor,
                          onRefresh: () async {
                            await provider.init();
                          },
                          child: NotificationListener<ScrollNotification>(
                            onNotification: (ScrollNotification scrollInfo) {
                              if (scrollInfo.metrics.pixels >= scrollInfo.metrics.maxScrollExtent - 100 &&
                                  !provider.isLoadingMore) {
                                provider.loadMoreMyOrders();
                              }
                              return false;
                            },
                            child: ListView.builder(
                              physics: const AlwaysScrollableScrollPhysics(),
                              itemCount: provider.filteredOrders.length,
                              itemBuilder: (context, index) {
                                var requestEntity = provider.filteredOrders[index];
                                String timeOnly = DateParser.dateFormatterOnlyTime(requestEntity.createdAt);

                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => OrderDetailsScreen(
                                                  date: provider.dateCreateOrder(index),
                                                  time: timeOnly,
                                                  orderId: requestEntity.id!,
                                                  location: requestEntity.location,
                                                  expiresAt: requestEntity.expiresAt!.split("T")[0],
                                                  total: requestEntity.total,
                                                  id: requestEntity.id!,
                                                  description: requestEntity.description,
                                                  status: requestEntity.status,
                                                )));
                                  },
                                  child: SPRequestItemWidget(),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: AppSizes.ph25),
                      provider.isLoadingMore
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: CircularProgressIndicator(
                                color: ColorManager.primaryBlueColor,
                              )),
                            )
                          : const SizedBox.shrink(),

                      /// orders section ///////////////////////////////////////////////////////
                      // Expanded(
                      //     child: ListView.builder(
                      //         itemCount: 12,
                      //         itemBuilder: (context, index) {
                      //           return InkWell(onTap: () {}, child: SPRequestItemWidget());
                      //         }))
                    ]);
        }),
      ),
    );
  }
}
