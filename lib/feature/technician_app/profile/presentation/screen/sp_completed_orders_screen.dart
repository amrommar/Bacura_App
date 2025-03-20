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
            itemCount: 10,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.spRequestDetailsRoute);
                },
                child: CustomShadowWidget(
                  childWidget: Column(
                    children: [
                      ////Time and Date section/////////////////////////////////////////////
                      const SpCompletedRequestTimeNumRow(),
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
