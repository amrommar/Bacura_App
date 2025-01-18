import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/core/utils/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RequestNumContactIconRow extends StatelessWidget {
  Color requestColor;

  RequestNumContactIconRow({super.key, required this.requestColor});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        '#3333452',
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: ColorManager.darkBlueColor, fontWeight: FontWeight.bold),
      ),
      Row(children: [
        InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.customerServiceRoute);
            },
            child: SvgPicture.asset(
              'assets/images/contact_icon.svg',
              height: 20.h,
            )),
        SizedBox(width: 10.w),
        Icon(Icons.circle, color: requestColor, size: 15)
      ])
    ]);
  }
}
