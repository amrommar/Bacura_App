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
            Image.asset('assets/images/Rectangle 78.png', height: 240.h),

            /// Available Services Section ////////////////////////////////////
            Padding(
              padding: EdgeInsets.only(right: 16.w, top: 16.h, left: 16.w),
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

            SizedBox(height: 100.h),

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
