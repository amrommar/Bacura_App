import 'package:bacura_app/presentation/resources/assets_manager.dart';
import 'package:bacura_app/presentation/resources/strings_manager.dart';
import 'package:bacura_app/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/color_manager.dart';

class OffersCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ColorManager.lightBlueColor,
              // Shadow color with opacity
              spreadRadius: 1,
              // Spread radius
              blurRadius: 1,
              // Blur radius
              offset: Offset(0, 2),
              // Offset in the x and y directions
            ),
          ],
          borderRadius: BorderRadius.circular(AppSize.s12),
          color: ColorManager.whiteColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //Image section ________________________________
          Container(
            height: 124.h, // Image height
            width: 230.w, // Image width
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s6),
              image: DecorationImage(
                image: AssetImage(ImageAssets.offer1), // Example image
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          // Spacing between image and text
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            width: 230.w,
            height: 45.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 175.w,
                  child: Text(
                    AppStrings.installingSurveillanceCameras,
                    maxLines: 2, // Set max number of lines to display
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
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
            child: Text(
              '1000 SR',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: ColorManager.darkRedColor),
            ),
          )
        ],
      ),
    );
  }
}
