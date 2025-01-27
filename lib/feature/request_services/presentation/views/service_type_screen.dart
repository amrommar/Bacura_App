import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/home/presentation/controller/home_provider.dart';
import 'package:bacura_app/feature/request_services/index.dart';
import 'package:bacura_app/feature/home/domain/entity/Category_entity.dart';

class ServiceTypeScreen extends StatelessWidget {
  final CategoryEntity categoryEntity;
  const ServiceTypeScreen({super.key, required this.categoryEntity});

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
                if (categoryEntity.id == 4)
                  Image.asset(
                    'assets/images/cameraa.jpg',
                    height: AppSizes.ph240,
                    fit: BoxFit.fill,
                  )
                else if (categoryEntity.id == 5)
                  Image.asset(
                    'assets/images/smart.jpg',
                    height: AppSizes.ph240,
                    fit: BoxFit.fill,
                  )
                else if (categoryEntity.id == 6)
                  Image.asset(
                    'assets/images/access.jpg',
                    height: AppSizes.ph240,
                    fit: BoxFit.fill,
                  )
                else if (categoryEntity.id == 7)
                  Image.asset(
                    'assets/images/sound.jpg',
                    height: AppSizes.ph240,
                    fit: BoxFit.fill,
                  )
                else if (categoryEntity.id == 10)
                  Image.asset(
                    'assets/images/savepower.jpg',
                    height: AppSizes.ph240,
                    fit: BoxFit.fill,
                  )
                else
                  Image.asset(
                    'assets/images/central.jpg',
                    height: AppSizes.ph240,
                    fit: BoxFit.fill,
                  ),

                // Available Services Section
                Padding(
                  padding: EdgeInsets.only(right: AppSizes.pw16, top: AppSizes.ph16, left: AppSizes.ph16),
                  child: Text(
                    AppLocalizations.of(context)!.available_services,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: ColorManager.darkBlueColor, fontWeight: FontWeight.bold),
                  ),
                ),

                // Service Containers
                Column(
                  children: List.generate(
                    categoryEntity.services.length,
                    (index) => ServiceTypeWidget(
                      text: categoryEntity.services[index].name!,
                      isSelected: provider.selectedService == categoryEntity.services[index].name,
                      onSelect: () {
                        provider.onSelectService(categoryEntity.services[index].name!);
                      },
                    ),
                  ),
                ),

                SizedBox(height: AppSizes.ph100),

                // Next Button
                NextButton(
                  isEnabled: provider.selectedService != null,
                  onPressed: provider.selectedService == null
                      ? null
                      : () {
                          Navigator.pushNamed(context, Routes.serviceDetailsRoute);
                        },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
