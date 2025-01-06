import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/core/utils/routes_manager.dart';
import 'package:bacura_app/feature/request_services/presentation/views/widgets/next_button.dart';
import 'package:bacura_app/feature/request_services/presentation/views/widgets/service_type_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceTypeViewBody extends StatefulWidget {
  const ServiceTypeViewBody({super.key});

  @override
  State<ServiceTypeViewBody> createState() => _ServiceTypeViewBodyState();
}

class _ServiceTypeViewBodyState extends State<ServiceTypeViewBody> {
  String? selectedService; // Track the currently selected service

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
          ServiceTypeContainer(
            text: 'تركيب وبرمجة',
            isSelected: selectedService == 'تركيب وبرمجة',
            onSelect: () {
              setState(() {
                selectedService = 'تركيب وبرمجة';
              });
            },
          ),
          ServiceTypeContainer(
            text: 'صيانة',
            isSelected: selectedService == 'صيانة',
            onSelect: () {
              setState(() {
                selectedService = 'صيانة';
              });
            },
          ),
          ServiceTypeContainer(
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
    );
  }
}
