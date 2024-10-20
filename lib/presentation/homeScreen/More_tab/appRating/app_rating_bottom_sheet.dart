import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/widgets/small_elevatedbutton.dart';
import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppRating_BottomSheet extends StatefulWidget {
  @override
  State<AppRating_BottomSheet> createState() => _AppRating_BottomSheetState();
}

class _AppRating_BottomSheetState extends State<AppRating_BottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ColorManager.transparent),
      height: 250.h,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/rating_img.png',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  'Rate Our App',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: ColorManager.whiteColor),
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, size: 60, color: ColorManager.yellowColor),
                    Icon(Icons.star, size: 60, color: ColorManager.yellowColor),
                    Icon(Icons.star, size: 60, color: ColorManager.yellowColor),
                    Icon(Icons.star, size: 60, color: ColorManager.yellowColor),
                    Icon(Icons.star,
                        size: 60, color: ColorManager.lightGreyColor),
                  ],
                ),
                SizedBox(height: 30.h),
                SmallElevatedbutton(
                    backgroundColor: ColorManager.lightBlueColor,
                    text: 'Rate',
                    textColor: ColorManager.primaryBlueColor,
                    onTap: () {
                      Navigator.pop(context);
                    }),
              ],
            ),
          )
        ],
      ),
    );
    // return Container(
    //   height: 250.h,
    //   decoration: BoxDecoration(
    //       color: ColorManager.lightBlueColor,
    //       borderRadius: BorderRadius.circular(AppSize.s20)),
    //   padding: EdgeInsets.all(AppPadding.p16),
    //   child: SingleChildScrollView(
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       children: [
    //         Text(
    //           'Rate Our App',
    //           style: Theme.of(context)
    //               .textTheme
    //               .titleLarge!
    //               .copyWith(color: ColorManager.darkBlueColor),
    //         ),
    //         SizedBox(height: 30.h),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Icon(Icons.star, size: 60, color: ColorManager.yellowColor),
    //             Icon(Icons.star, size: 60, color: ColorManager.yellowColor),
    //             Icon(Icons.star, size: 60, color: ColorManager.yellowColor),
    //             Icon(Icons.star, size: 60, color: ColorManager.yellowColor),
    //             Icon(Icons.star, size: 60, color: ColorManager.lightGreyColor),
    //           ],
    //         ),
    //         SizedBox(height: 30.h),
    //         SmallElevatedbutton(
    //             text: 'Rate',
    //             onTap: () {
    //               Navigator.pop(context);
    //             })
    //       ],
    //     ),
    //   ),
    // );
  }
}
