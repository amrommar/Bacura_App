import 'package:bacura_app/core/services/number_parser.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/my_orders/domain/entity/items_for_order_entity.dart';
import 'package:bacura_app/feature/my_orders/presentation/controller/order_details_provider.dart';
import 'package:bacura_app/feature/my_orders/presentation/views/widget/cancelled_order_bottom_widget.dart';
import 'package:bacura_app/feature/my_orders/presentation/views/widget/completed_order_bottom_widget.dart';
import 'package:bacura_app/feature/my_orders/presentation/views/widget/manage_ongoing_order_bottom_sheet.dart';
import 'package:bacura_app/feature/my_orders/presentation/views/widget/ongoing_order_bottom_widget.dart';
import 'package:bacura_app/feature/my_orders/presentation/views/widget/order_num_contact_icon_widget.dart';
import 'package:shimmer/shimmer.dart';

class OrderDetailsScreen extends StatelessWidget {
  final int? orderId;
  final String? date;
  final String? time;
  final String? description;
  final Color? requestColor;
  final String? location;
  final String? expiresAt;
  final int? total;
  final int id;
  final int orderIndex;

  final String? status;

  const OrderDetailsScreen(
      {super.key,
      this.orderId,
      this.date,
      this.time,
      this.requestColor,
      this.location,
      this.expiresAt,
      this.total,
      this.description,
      required this.id,
      required this.orderIndex,
      this.status});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        AppLocalizations.of(context)!.request_details,
      )),
      body: ChangeNotifierProvider(
        create: (context) => OrderDetailsProvider(id: id),
        child: Consumer<OrderDetailsProvider>(
          builder: (context, provider, child) => Container(
            decoration: BoxDecoration(
                color: ColorManager.whiteColor,
                borderRadius: BorderRadius.circular(AppSizes.br12),
                boxShadow: [
                  BoxShadow(
                    color: ColorManager.lightBlueColor,
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 3),
                  )
                ]),
            margin: EdgeInsets.symmetric(horizontal: AppSizes.ph12, vertical: AppSizes.ph12),
            padding: EdgeInsets.symmetric(horizontal: AppSizes.ph12, vertical: AppSizes.ph12),
            height: AppSizes.ph800,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  OrderNumContactIconWidget(requestColor: requestColor ?? ColorManager.yellowColor, orderId: orderId!),
                  const Divider(),
                  OrderTimeDateWidget(date: date ?? '10/10/2010', time: time ?? '10:10'),
                  provider.isItemsLoading
                      ? const ItemsShimmerWidget()
                      : provider.itemsForOrderEntity.isEmpty
                          ? Padding(
                              padding: EdgeInsets.all(AppSizes.ph15),
                              child: Center(
                                  child: Column(
                                children: [
                                  Text(description ?? ''),
                                  SizedBox(height: AppSizes.ph10),
                                  Text(status == 'pending'
                                      ? 'جاري تجهيز عرض السعر '
                                      : status == 'declined'
                                          ? 'لقد تم إلغاء طلبك'
                                          : ''),
                                ],
                              )),
                            )
                          : Container(
                              padding: EdgeInsets.all(AppSizes.ph15),
                              margin: EdgeInsets.symmetric(vertical: AppSizes.ph12),
                              decoration: BoxDecoration(
                                color: ColorManager.lightBlueColor,
                                borderRadius: BorderRadius.circular(AppSizes.br8),
                              ),
                              child: ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(children: [
                                    Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                                      Expanded(
                                          child: Text(provider.itemsForOrderEntity[index]?.name ?? '',
                                              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                                    color: ColorManager.blackColor,
                                                  ))),
                                      Text(
                                          '${NumberParser.translateNumber((provider.itemsForOrderEntity[index]?.price).toString())} ريال',
                                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                                color: ColorManager.darkRedColor,
                                              ))
                                    ]),
                                  ]);
                                },
                                separatorBuilder: (BuildContext context, int index) {
                                  return Divider(
                                    color: ColorManager.whiteColor,
                                  );
                                },
                                itemCount: provider.itemsForOrderEntity.length,
                              ),
                            ),
                  if (total! > 0)
                    Container(
                      padding: EdgeInsets.only(
                        left: AppSizes.pw8,
                        right: AppSizes.pw8,
                        top: AppSizes.ph8,
                      ),
                      height: 40.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.total,
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: ColorManager.darkBlueColor,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            '${NumberParser.translateNumber((total).toString())} ريال',
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: ColorManager.primaryBlueColor,
                                ),
                          ),
                        ],
                      ),
                    ),
                  const Divider(),
                  OrderDetailsIconTextsRow(
                    title: AppLocalizations.of(context)!.location,
                    description: location ?? '',
                    icon: Icons.location_on,
                  ),
                  OrderDetailsIconTextsRow(
                      title: AppLocalizations.of(context)!.payment_method,
                      description: 'بطاقة إئتمانية',
                      icon: Icons.credit_card,
                      iconColor: ColorManager.greyColor),
                  OrderDetailsIconTextsRow(
                      title: AppLocalizations.of(context)!.payment_status,
                      description: status == 'pending'
                          ? 'لم يتم الدفع'
                          : status == 'declined'
                              ? 'لم يتم الدفع'
                              : status == 'approved'
                                  ? 'لم يتم الدفع'
                                  : status == 'confirmed'
                                      ? 'تم الدفع'
                                      : 'تم الدفع',
                      icon: status == 'pending'
                          ? Icons.cancel
                          : status == 'approved'
                              ? Icons.cancel
                              : status == 'declined'
                                  ? Icons.cancel
                                  : Icons.check_circle,
                      iconColor: requestColor!),
                  OrderDetailsIconTextsRow(
                      title: AppLocalizations.of(context)!.warranty_status,
                      description: expiresAt ?? '',
                      icon: Icons.verified_user,
                      iconColor: requestColor!),
                  const Divider(),
                  SizedBox(height: AppSizes.ph50),
                  provider.isItemsLoading
                      ? const Center(child: CircularProgressIndicator())
                      : manageRequestButtons(
                          status!,
                          time: time!,
                          context: context,
                          index: orderIndex,
                          item: provider.itemsForOrderEntity,
                        ),
                  SizedBox(height: AppSizes.ph20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget manageRequestButtons(
    String requestStatus, {
    required BuildContext context,
    required int index,
    required List<ItemsForOrderEntity?> item,
    required String time,
  }) {
    //TODO: change this AMR
    if (requestStatus == 'pending') {
      return OnGoingOrderBottomWidget(onPressed: () {
        showManageRequestBottomSheet(context, index);
      });
    } else if (requestStatus == 'declined') {
      return const CancelledOrderBottomWidget();
    } else if (requestStatus == 'approved') {
      return OnGoingOrderBottomWidget(onPressed: () {
        showManageRequestBottomSheet(context, index);
      });
    } else if (requestStatus == 'confirmed') {
      return CompletedOrderBottomWidget(
        invoiceData: item.map((item) {
          return {
            'description': item?.name ?? 'لا يوجد وصف',
            'date': time,
            'quantity': item?.quantity ?? 0,
            'vat': 0.15,
            'unitPrice': (item?.price ?? 0.0).toDouble(),
          };
        }).toList(),
        mobileNumber: "",
        name: '',
        address: '',
      );
    } else if (requestStatus == 'completed') {
      return CompletedOrderBottomWidget(
        invoiceData: item.map((item) {
          return {
            'description': item?.name ?? 'لا يوجد وصف',
            'date': time,
            'quantity': item?.quantity ?? 0, // تأكد من تحويل quantity إلى double
            'vat': 0.15, // قيمة الـ VAT ستكون ثابتة هنا
            'unitPrice': (item?.price ?? 0.0).toDouble(), // تأكد من تحويل price إلى double
          };
        }).toList(),
        mobileNumber: "",
        name: '',
        address: '',
      );
    }

    return Container();
  }

  void showManageRequestBottomSheet(BuildContext context, int index) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ManageOnGoingOrderBottomSheet(
            index: index,
          );
        });
  }
}

class ItemsShimmerWidget extends StatelessWidget {
  const ItemsShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorManager.lightBlueColor,
      highlightColor: ColorManager.whiteColor,
      child: Container(
        padding: EdgeInsets.all(AppSizes.ph15),
        margin: EdgeInsets.symmetric(vertical: AppSizes.ph12),
        decoration: BoxDecoration(
          color: ColorManager.lightBlueColor,
          borderRadius: BorderRadius.circular(AppSizes.br8),
        ),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          // عدد العناصر
          separatorBuilder: (context, index) => SizedBox(height: 10.h),
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 20.h,
                        color: ColorManager.whiteColor,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Container(
                      height: 20.h,
                      width: 20.w,
                      color: ColorManager.whiteColor,
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
