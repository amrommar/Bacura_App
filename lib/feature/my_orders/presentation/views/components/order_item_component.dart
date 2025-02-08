import 'package:bacura_app/core/services/date_parser.dart';
import 'package:bacura_app/core/services/number_parser.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/my_orders/presentation/controller/my_order_provider.dart';
import 'package:bacura_app/feature/my_orders/presentation/views/widget/order_num_contact_icon_widget.dart';
import 'package:intl/intl.dart';

class OrderItemComponent extends StatelessWidget {
  final Color backgroundColor;
  final Color requestColor;
  final int index;
  final bool isLoading;

  const OrderItemComponent({
    super.key,
    required this.backgroundColor,
    required this.requestColor,
    required this.index,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MyOrderProvider>(
      builder: (context, provider, child) {
        return _buildRequestContainer(provider, context);
      },
    );
  }

  Widget _buildRequestContainer(MyOrderProvider provider, BuildContext context) {
    var requestEntity = provider.filteredOrders[index];
    int number = requestEntity.total ?? 0;
    String formattedNumber = NumberFormat('#,###').format(number);
    String timeOnly = DateParser.dateFormatterOnlyTime(requestEntity.createdAt);

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppSizes.br12),
        boxShadow: [
          BoxShadow(
            color: ColorManager.midWhiteColor,
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 3),
          )
        ],
      ),
      margin: EdgeInsets.only(right: AppSizes.pw18, top: AppSizes.ph18, left: AppSizes.pw18),
      padding: EdgeInsets.symmetric(horizontal: AppSizes.pw12, vertical: AppSizes.ph12),
      height: AppSizes.ph180,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          OrderNumContactIconWidget(
            requestColor: requestColor,
            orderId: requestEntity.id!,
          ),
          SizedBox(
            width: AppSizes.pw400,
            child: Text(
              requestEntity.description,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: ColorManager.blackColor,
                  ),
            ),
          ),
          OrderTimeDateWidget(date: provider.dateCreateOrder(index), time: timeOnly),
          if (requestEntity.total! > 0)
            Text(
              '${NumberParser.translateNumber((formattedNumber).toString())} ريال',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorManager.darkBlueColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
        ],
      ),
    );
  }
}
