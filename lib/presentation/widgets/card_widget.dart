import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:bacura_app/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ApartmentCard extends StatelessWidget {
  String imagePath;
  String apartmentTitle;

  ApartmentCard({required this.imagePath, required this.apartmentTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
          color: ColorManager.lightBlueColor,
          child: Container(
              padding: EdgeInsets.all(AppPadding.p20),
              height: 100.h,
              width: 100.h,
              child: SvgPicture.asset(imagePath)),
        ),
        Container(
          width: 100.w,
          child: Text(
            apartmentTitle,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: ColorManager.blackColor),
          ),
        ),
      ],
    );

    SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            color: ColorManager.lightBlueColor,
            child: Container(
                padding: EdgeInsets.all(AppPadding.p20),
                height: 100.h,
                width: 100.h,
                child: SvgPicture.asset(imagePath)),
          ),
          Text(
            apartmentTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: ColorManager.blackColor),
          ),
        ],
      ),
    );
  }
}
