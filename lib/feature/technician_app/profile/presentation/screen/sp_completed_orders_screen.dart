import 'package:bacura_app/core/services/date_parser.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/technician_app/orders/presentation/views/sp_order_details_screen.dart';
import 'package:bacura_app/feature/technician_app/profile/presentation/controller/completed_orders_provider.dart';

class SpCompletedOrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الطلبات المنجزة'),
      ),
      body: ChangeNotifierProvider<CompletedOrdersProvider>(
        create: (context) => CompletedOrdersProvider(),
        child: Consumer<CompletedOrdersProvider>(builder: (context, provider, child) {
          return provider.isLoadingMyOrders
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: provider.myOrderEntity.myOrderDataEntity.length,
                  itemBuilder: (context, index) {
                    var orderEntity = provider.myOrderEntity.myOrderDataEntity[index];
                    String timeOnly = DateParser.dateFormatterOnlyTime(orderEntity.installationDate);
                    var installationDate = orderEntity.installationDate!.split("T")[0];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SpOrderDetailsScreen(
                              id: orderEntity.id!,
                              phoneNumber: orderEntity.user!.phone!,
                              time: timeOnly,
                              clientName: orderEntity.user!.name,
                              date: installationDate,
                              latitude: orderEntity.latitude,
                              longitude: orderEntity.longitude,
                              orderId: orderEntity.id,
                              serviceName: orderEntity.service!.name,
                              status: orderEntity.status,
                            ),
                          ),
                        );
                      },
                      child: CustomShadowWidget(
                        childWidget: Column(
                          children: [
                            ////Time and Date section/////////////////////////////////////////////
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                              Text(
                                '#${orderEntity.id}',
                                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                      color: ColorManager.darkBlueColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                Icon(
                                  Icons.calendar_month_outlined,
                                  color: ColorManager.primaryBlueColor,
                                  size: AppSizes.ph20,
                                ),
                                SizedBox(width: AppSizes.ph5),
                                Text('$installationDate',
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                          color: ColorManager.greyColor,
                                        ))
                              ]),
                              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                Icon(
                                  Icons.access_time_outlined,
                                  color: ColorManager.primaryBlueColor,
                                  size: AppSizes.ph20,
                                ),
                                SizedBox(width: AppSizes.pw2),
                                Text(timeOnly,
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                          color: ColorManager.greyColor,
                                        ))
                              ])
                            ]),
                            const Divider(),
                            SizedBox(height: AppSizes.ph10),

                            Row(
                              children: [
                                Text(
                                  'اسم العميل: ',
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                        color: ColorManager.darkBlueColor,
                                      ),
                                ),
                                Text(
                                  '${orderEntity.user!.name}',
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                        color: ColorManager.primaryBlueColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
        }),
      ),
    );
  }
}
