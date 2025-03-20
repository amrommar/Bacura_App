import 'package:bacura_app/core/services/date_parser.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/profile/presentation/controller/my_profile_provider.dart';
import 'package:bacura_app/feature/technician_app/home/controller/sp_orders_provider.dart';
import 'package:bacura_app/feature/technician_app/home/presentation/views/components/sp_notifications_icon_widget.dart';
import 'package:bacura_app/feature/technician_app/profile/presentation/screen/index.dart';
import 'package:bacura_app/feature/technician_app/orders/presentation/views/sp_order_details_screen.dart';

class SpOrdersScreen extends StatefulWidget {
  const SpOrdersScreen({super.key});

  @override
  State<SpOrdersScreen> createState() => _SpOrdersScreenState();
}

class _SpOrdersScreenState extends State<SpOrdersScreen> {
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
          leading: InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.spProfileDetailsRoute);
              },
              child: Row(children: [
                SizedBox(width: AppSizes.pw8),
                Flexible(
                    child: CircleAvatar(
                        radius: AppSizes.br24,
                        backgroundColor: ColorManager.whiteColor,
                        child: Image.asset(AppAssets.bacuraImage)))
              ])),
          actions: const [
            SpNotificationsIconWidget(),
          ]),
      body: ChangeNotifierProvider(
        create: (context) => SpOrdersProvider(),
        child: Consumer<SpOrdersProvider>(
          builder: (context, provider, child) => provider.isLoadingMyOrders
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    /// orders section ///////////////////////////////////////////////////////
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () => provider.onRefresh(),
                        child: NotificationListener<ScrollNotification>(
                          onNotification: (ScrollNotification scrollInfo) {
                            if (scrollInfo.metrics.pixels >= scrollInfo.metrics.maxScrollExtent - 100 &&
                                !provider.isLoadingMore) {
                              provider.loadMoreMyOrders();
                            }
                            return false;
                          },
                          child: ListView.builder(
                            itemCount: provider.myOrderEntity.myOrderDataEntity.length,
                            itemBuilder: (context, index) {
                              var orderEntity = provider.myOrderEntity.myOrderDataEntity[index];
                              String timeOnly = DateParser.dateFormatterOnlyTime(orderEntity.installationDate);
                              var installationDate = orderEntity.installationDate!.split("T")[0];
                              return SPOrderItemWidget(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SpOrderDetailsScreen(
                                        id: orderEntity.id!,
                                        time: timeOnly,
                                        clientName: orderEntity.user!.name,
                                        date: installationDate,
                                        latitude: orderEntity.latitude,
                                        longitude: orderEntity.longitude,
                                        orderId: orderEntity.id,
                                        serviceName: orderEntity.service!.name,
                                        phoneNumber: orderEntity.user!.phone!,
                                      ),
                                    ),
                                  );
                                },
                                index: index,
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
                  ],
                ),
        ),
      ),
    );
  }
}
