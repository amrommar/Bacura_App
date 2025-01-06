import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RareService extends StatelessWidget {
  final Function() onTap;
  final String imagePath;
  final String serviceTitle;

  RareService({
    super.key,
    required this.onTap,
    required this.imagePath,
    required this.serviceTitle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Add functionality when tapping the container
      child: SizedBox(
        height: 155.h,
        width: 200.w,
        child: Container(
          padding: const EdgeInsets.all(4),
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorManager.darkBlueColor,
                ColorManager.midBlueColor,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: ColorManager.soLightGreyColor,
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 3), // Offset in the x and y directions
              ),
            ],
            borderRadius: BorderRadius.circular(12),
          ),
          margin: EdgeInsets.all(8.h),
          child: Column(
            children: [
              Image.asset(
                imagePath,
                height: 95.h,
                width: 120.h,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 5.h),
              Text(
                serviceTitle,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: ColorManager.whiteColor,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
