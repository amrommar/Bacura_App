import 'package:bacura_app/presentation/resources/assets_manager.dart';
import 'package:bacura_app/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';

class OffersCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //Image section ________________________________
        Container(
          height: 124.h, // Image height
          width: 230.w, // Image width
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            image: DecorationImage(
              image: AssetImage(ImageAssets.offer1), // Example image
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 8.h),
        // Spacing between image and text
        Container(
          width: 230.w,
          height: 20.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 175.w,
                child: Text(
                  AppStrings.installing_Surveillance_Cameras,
                  maxLines: 1, // Set max number of lines to display
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: ColorManager.blackColor),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    '4.5', // Example text
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: ColorManager.blackColor),
                  ),
                  SizedBox(width: 3.w),
                  Icon(
                    Icons.star,
                    color: ColorManager.yellowColor,
                    size: 16,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
