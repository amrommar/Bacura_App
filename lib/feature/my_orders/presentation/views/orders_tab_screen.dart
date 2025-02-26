import 'package:bacura_app/core/presentation/widget/shimmer.dart';
import 'package:bacura_app/core/services/date_parser.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/my_orders/presentation/controller/my_order_provider.dart';
import 'package:bacura_app/feature/my_orders/presentation/views/components/order_item_component.dart';
import 'package:bacura_app/feature/my_orders/presentation/views/widget/order_filter_widget.dart';
import 'package:bacura_app/feature/my_orders/utils.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class OrdersTabScreen extends StatelessWidget {
  const OrdersTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyOrderProvider(),
      child: Consumer<MyOrderProvider>(builder: (context, provider, child) {
        return provider.isLoadingMyOrders
            ? buildShimmerContainer()
            : provider.myOrderEntity.myOrderDataEntity.isEmpty
                ? const Center(child: Text('لا يوجد طلبات'))
                : Column(
                    children: [
                      SizedBox(height: AppSizes.ph5),
                      const ordersFilterWidget(),
                      Divider(color: ColorManager.lightBlueColor),
                      Expanded(
                        child: LazyLoadScrollView(
                          onEndOfPage: () => provider.loadMoreMyOrders(),
                          child: ListView.builder(
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
                                                requestColor: statusColors[requestEntity.status]!,
                                                location: requestEntity.location,
                                                expiresAt: requestEntity.expiresAt!.split("T")[0],
                                                total: requestEntity.total,
                                                id: requestEntity.id!,
                                                description: requestEntity.description,
                                                status: requestEntity.status,
                                              )));
                                },
                                child: OrderItemComponent(
                                  backgroundColor: requestColor(statusColors[provider.filteredOrders[index].status]!),
                                  requestColor: statusColors[provider.filteredOrders[index].status]!,
                                  index: index,
                                ),
                              );
                            },
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
                  );
      }),
    );
  }
}
