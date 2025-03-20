import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/technician_app/profile/presentation/controller/completed_orders_provider.dart';
import 'package:bacura_app/feature/technician_app/profile/presentation/screen/index.dart';

class SpCompletedOrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CompletedOrdersProvider>(
      create: (context) => CompletedOrdersProvider(),
      child: Consumer<CompletedOrdersProvider>(
        builder: (context, provider, child) => Scaffold(
          appBar: AppBar(
            title: const Text('الطلبات المنجزة'),
          ),
          body: ListView.builder(
            itemCount: provider.myOrderEntity.myOrderDataEntity.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.spRequestDetailsRoute);
                },
                child: CustomShadowWidget(
                  childWidget: Column(
                    children: [
                      ////Time and Date section/////////////////////////////////////////////
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        Text(
                          '#3333452',
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
                          Text('9/10/2024',
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
                          Text('10:35 ص',
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
                            "clientName",
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
          ),
        ),
      ),
    );
  }
}
