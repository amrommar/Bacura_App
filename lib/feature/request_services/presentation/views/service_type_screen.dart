import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/home/presentation/controller/home_provider.dart';
import 'package:bacura_app/feature/request_services/index.dart';
import 'package:bacura_app/feature/home/domain/entity/Category_entity.dart';

class ServiceTypeScreen extends StatelessWidget {
  final CategoryEntity categoryEntity;
  const ServiceTypeScreen({super.key, required this.categoryEntity});

  // Track the currently selected service
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
                /// Service image ////////////////////////////////////
                Image.asset('assets/images/png/Rectangle 78.png', height: 240.h),

                /// Available Services Section ////////////////////////////////////
                Padding(
                  padding: EdgeInsets.only(right: 16.w, top: 16.h, left: 16.w),
                  child: Text(
                    AppLocalizations.of(context)!.available_services,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: ColorManager.darkBlueColor, fontWeight: FontWeight.bold),
                  ),
                ),

                /// Service Containers ////////////////////////////////////

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

                SizedBox(height: 100.h),

                /// Next Button ////////////////////////////////////
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
