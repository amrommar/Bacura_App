import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/request_services/index.dart';

class ServiceTypeScreen extends StatefulWidget {
  const ServiceTypeScreen({super.key});

  @override
  State<ServiceTypeScreen> createState() => _ServiceTypeScreenState();
}

class _ServiceTypeScreenState extends State<ServiceTypeScreen> {
  String? selectedService; // Track the currently selected service

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as int?;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.service_type),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Service image ////////////////////////////////////
            if (args == 4)
              Image.asset(
                'assets/images/cameraa.jpg',
                height: AppSizes.ph240,
                fit: BoxFit.fill,
              )
            else if (args == 5)
              Image.asset(
                'assets/images/smart.jpg',
                height: AppSizes.ph240,
                fit: BoxFit.fill,
              )
            else if (args == 6)
              Image.asset(
                'assets/images/access.jpg',
                height: AppSizes.ph240,
                fit: BoxFit.fill,
              )
            else if (args == 7)
              Image.asset(
                'assets/images/sound.jpg',
                height: AppSizes.ph240,
                fit: BoxFit.fill,
              )
            else if (args == 10)
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

            /// Available Services Section ////////////////////////////////////
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

            /// Service Containers ////////////////////////////////////
            ServiceTypeWidget(
              text: 'تركيب وبرمجة',
              isSelected: selectedService == 'تركيب وبرمجة',
              onSelect: () {
                setState(() {
                  selectedService = 'تركيب وبرمجة';
                });
              },
            ),
            ServiceTypeWidget(
              text: 'صيانة',
              isSelected: selectedService == 'صيانة',
              onSelect: () {
                setState(() {
                  selectedService = 'صيانة';
                });
              },
            ),
            ServiceTypeWidget(
              text: 'توريد',
              isSelected: selectedService == 'توريد',
              onSelect: () {
                setState(() {
                  selectedService = 'توريد';
                });
              },
            ),

            SizedBox(height: AppSizes.ph100),

            /// Next Button ////////////////////////////////////
            NextButton(
              isEnabled: selectedService != null, // Enable only if a service is selected
              onPressed: selectedService == null
                  ? null // Disable if no service is selected
                  : () {
                      Navigator.pushNamed(context, Routes.serviceDetailsRoute); // Navigate to next screen
                    },
            ),
          ],
        ),
      ),
    );
  }
}

/// container have circle icon and text ////////////////////////////////////
