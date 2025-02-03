import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/home/domain/entity/Category_entity.dart';
import 'package:bacura_app/feature/home/presentation/controller/home_provider.dart';
import 'package:bacura_app/feature/request_services/index.dart';

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
            builder: (context, provider, child) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Section
                if (categoryEntity!.id == 4)
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/camree.jpg',
                      width: double.infinity,
                    ),
                  )
                else if (categoryEntity!.id == 5)
                  Image.asset(
                    'assets/images/smart1.jpg',
                    width: double.infinity,
                  )
                else if (categoryEntity!.id == 6)
                  Image.asset(
                    'assets/images/sound1.jpg',
                    width: double.infinity,
                  )
                else if (categoryEntity!.id == 7)
                  Image.asset(
                    'assets/images/sound1.jpg',
                    width: double.infinity,
                  )
                else if (categoryEntity!.id == 10)
                  Image.asset(
                    'assets/images/saveenrgy.jpg',
                    width: double.infinity,
                  )
                else
                  Image.asset(
                    'assets/images/central1.jpg',
                    height: AppSizes.ph240,
                    width: double.infinity,
                  ),

                // Available Services Section
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

                // Service Containers
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
                                      builder: (context) => ServiceDetailsScreen(
                                            categoryId: categoryEntity!.id!,
                                            serviceId: categoryEntity!.services[provider.selectedServiceIndex!].id!,
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
