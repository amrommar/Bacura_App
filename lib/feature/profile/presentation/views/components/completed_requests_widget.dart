import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/technician_app/profile/presentation/controller/completed_orders_provider.dart';
import 'package:bacura_app/feature/technician_app/profile/presentation/screen/sp_completed_orders_screen.dart';

class CompleteOrdersWidget extends StatelessWidget {
  const CompleteOrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CompletedOrdersProvider>(
      create: (context) => CompletedOrdersProvider(),
      child: Consumer<CompletedOrdersProvider>(
        builder: (context, provider, child) => InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SpCompletedOrdersScreen()));
          },
          child: CustomShadowWidget(
            childWidget: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.request_page_outlined, color: ColorManager.midBlueColor),
                    SizedBox(width: AppSizes.pw10),
                    Text('الطلبات المنجزة',
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: ColorManager.darkBlueColor,
                            ))
                  ],
                ),
                SizedBox(width: AppSizes.pw10),
                provider.isLoadingMyOrders
                    ? SizedBox(
                        height: AppSizes.ph20,
                        width: AppSizes.pw20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: ColorManager.midBlueColor,
                        ),
                      )
                    : Text(provider.myOrderEntity.myOrderDataEntity.length.toString(),
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: ColorManager.blackColor,
                            ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
