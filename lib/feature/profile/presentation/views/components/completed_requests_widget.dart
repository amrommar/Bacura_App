import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/technician_app/profile/presentation/screen/sp_completed_orders_screen.dart';

class CompleteOrdersWidget extends StatelessWidget {
  const CompleteOrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
            Text('24',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: ColorManager.blackColor,
                    ))
          ],
        ),
      ),
    );
  }
}
