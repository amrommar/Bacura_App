import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/core/utils/routes_manager.dart';
import 'package:bacura_app/feature/requests/presetation/views/widgets/request_details_container.dart';
import 'package:bacura_app/feature/requests/presetation/views/widgets/request_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Requests_Tab extends StatefulWidget {
  @override
  State<Requests_Tab> createState() => _Requests_TabState();
}

class _Requests_TabState extends State<Requests_Tab> {
  List<Color> colors = [
    ColorManager.yellowColor,
    ColorManager.primaryBlueColor,
    ColorManager.greenColor,
    ColorManager.redColor,
    ColorManager.yellowColor,
    ColorManager.primaryBlueColor,
    ColorManager.greenColor,
    ColorManager.redColor,
    ColorManager.yellowColor,
    ColorManager.primaryBlueColor,
    ColorManager.greenColor,
    ColorManager.redColor
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 5.h),

      /// filtering section ///////////////////////////////////////////////////////
      const RequestsFilter(),
      Divider(color: ColorManager.lightBlueColor),

      /// Requests section ///////////////////////////////////////////////////////

      Expanded(
          child: ListView.builder(
              itemCount: 12,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.requestDetailsRoute);
                    },
                    child: RequestDetailsContainer(
                      backgroundColor: requestColor(colors[index]),
                      requestColor: colors[index],
                    ));
              }))
    ]);
  }

  Color requestColor(Color currentColor) {
    if (currentColor == ColorManager.yellowColor) {
      return ColorManager.lightYellowColor;
    } else if (currentColor == ColorManager.primaryBlueColor) {
      return ColorManager.lightBlueColor;
    } else if (currentColor == ColorManager.greenColor) {
      return ColorManager.lightGreenColor;
    } else if (currentColor == ColorManager.redColor) {
      return ColorManager.lightRedColor;
    }
    return ColorManager.whiteColor;
  }
}
