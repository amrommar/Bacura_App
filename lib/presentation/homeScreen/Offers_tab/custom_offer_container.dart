import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/values_manager.dart';

class Custom_Offer_container extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s8),
        color: ColorManager.midWhiteColor,
      ),
      margin: EdgeInsets.symmetric(
          horizontal: AppMargin.m12, vertical: AppMargin.m6),
      height: 115.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              height: 110.h,
              width: 165.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.s8),
                child: Image.asset(
                  'assets/images/offer1.png',
                  fit: BoxFit.cover,
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p6),
            child: Column(
              children: [
                Container(
                  width: 150.w,
                  child: Text('4 External smart IP cameras (6 mega resolution)',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: ColorManager.blackColor, fontSize: 14),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '3 days left',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: ColorManager.darkRedColor, fontSize: 12),
                ),
                Text(
                  '1000 SR',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: ColorManager.darkRedColor,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
