import 'package:bacura_app/core/presentation/widget/shimmer.dart';
import 'package:bacura_app/core/services/date_parser.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/my_orders/presentation/controller/my_order_provider.dart';
import 'package:bacura_app/feature/my_orders/presentation/views/components/order_item_component.dart';
import 'package:bacura_app/feature/my_orders/presentation/views/widget/order_filter_widget.dart';
import 'package:bacura_app/feature/my_orders/utils.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class OrdersTabScreen extends StatefulWidget {
  const OrdersTabScreen({super.key});

  @override
  State<OrdersTabScreen> createState() => _OrdersTabScreenState();
}

class _OrdersTabScreenState extends State<OrdersTabScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyOrderProvider(),
      child: Consumer<MyOrderProvider>(builder: (context, provider, child) {
        return provider.isLoadingMyOrders
            ? buildShimmerContainer()
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
                                            orderId: requestEntity.id.toString(),
                                            requestColor: statusColors[requestEntity.status]!,
                                            location: requestEntity.location,
                                            expiresAt: requestEntity.expiresAt!.split("T")[0],
                                            total: requestEntity.total,
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
                      ? const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(child: CircularProgressIndicator()),
                        )
                      : const SizedBox.shrink(),
                ],
              );
      }),
    );
  }
}
