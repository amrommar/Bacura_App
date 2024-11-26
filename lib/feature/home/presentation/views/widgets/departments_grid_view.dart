import 'package:bacura_app/core/utils/assets_manager.dart';
import 'package:bacura_app/core/utils/routes_manager.dart';
import 'package:bacura_app/core/utils/strings_manager.dart';
import 'package:bacura_app/feature/home/presentation/views/widgets/department_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DepartmentsGridView extends StatelessWidget {
  DepartmentsGridView({super.key});

  List<String> imagesPaths = [
    ImageAssets.cameraIcon,
    ImageAssets.smartHomeIcon,
    ImageAssets.accessControlIcon,
    ImageAssets.soundSystemsIcon,
    ImageAssets.savePowerIcon,
    ImageAssets.networkIcon,
    ImageAssets.gameRepairIcon,
    ImageAssets.pcRepairIcon,
    ImageAssets.phoneRepairIcon
  ];
  List<String> imagesTitle = [
    AppStrings.security_and_monitoring,
    AppStrings.smartSystems,
    AppStrings.accessControl,
    AppStrings.soundSystems,
    AppStrings.saveEnergy,
    AppStrings.networks_communications,
    AppStrings.gameMaintenance,
    AppStrings.computerMaintenance,
    AppStrings.phoneMaintenance
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            // Disable scrolling inside GridView
            shrinkWrap: true,
            // Let it take only necessary height
            itemCount: 6,
            // Replace with your departments list length
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                // Number of items per row
                crossAxisSpacing: 0.w,
                // Horizontal space between items
                mainAxisSpacing: 10.h,
                // Vertical space between items
                childAspectRatio: 1),
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.serviceTypeRoute);
                  },
                  child: DepartmentCard(
                    departmentTitle: imagesTitle[index],
                    imagePath: imagesPaths[index],
                  )); // Widget for each apartment card
            }));
  }
}
