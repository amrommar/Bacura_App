import 'package:bacura_app/presentation/resources/assets_manager.dart';
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
        Container(
          height: 124.h, // Image height
          width: 205.w, // Image width
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            image: DecorationImage(
              image: AssetImage(ImageAssets.offer1), // Example image
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 8.h), // Spacing between image and text
        Container(
          width: 205.h,
          height: 20.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'تركيب كاميرات المراقبة ', // Example text
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: ColorManager.blackColor),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '4', // Example text
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: ColorManager.blackColor),
                  ),
                  Icon(
                    Icons.star,
                    color: ColorManager.yellowColor,
                    size: 20,
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
