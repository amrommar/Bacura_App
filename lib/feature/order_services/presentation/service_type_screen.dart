import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/home/domain/entity/Category_entity.dart';
import 'package:bacura_app/feature/home/presentation/controller/home_provider.dart';
import 'package:bacura_app/feature/order_services/index.dart';
import 'package:bacura_app/feature/order_services/presentation/order_request_screen.dart';

class ServiceTypeScreen extends StatelessWidget {
  final CategoryEntity? categoryEntity;

  const ServiceTypeScreen({super.key, this.categoryEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.service_type),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: ChangeNotifierProvider(
          create: (context) => HomeProvider(),
          child: Consumer<HomeProvider>(
            builder: (context, provider, child) => provider.isCategoryLoading
                ? const CategoryShimmerWidget()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(categoryEntity!.cover!),
                      Padding(
                        padding: EdgeInsets.only(right: AppSizes.pw16, top: AppSizes.ph16, left: AppSizes.ph16),
                        child: Text(
                          AppLocalizations.of(context)!.available_services,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: ColorManager.darkBlueColor, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Column(
                        children: [
                          Column(
                            children: List.generate(
                              categoryEntity!.services.length,
                              (index) => ServiceTypeWidget(
                                text: categoryEntity!.services[index].name!,
                                isSelected: provider.selectedServiceIndex == index,
                                onSelect: () {
                                  provider.onSelectService(index);
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: AppSizes.ph100),
                          NextButton(
                            isEnabled: provider.selectedServiceIndex != null,
                            onPressed: provider.selectedServiceIndex == null
                                ? null
                                : () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => OrderRequestScreen(
                                                  categoryId: categoryEntity!.id!,
                                                  serviceId:
                                                      categoryEntity!.services[provider.selectedServiceIndex!].id!,
                                                )));
                                  },
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
