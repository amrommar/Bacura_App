import 'package:bacura_app/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';

class CustomRow_Details extends StatefulWidget {
  IconData icon;
  String text;
  String value;
  Function() onTap;

  CustomRow_Details({
    required this.icon,
    required this.onTap,
    required this.text,
    required this.value,
  });

  @override
  State<CustomRow_Details> createState() => _CustomRow_DetailsState();
}

class _CustomRow_DetailsState extends State<CustomRow_Details> {
  ////// Custom Row contain: (Icon - Column : 'text / text' - text)/////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          widget.icon,
          color: ColorManager.primaryBlueColor,
          size: 30,
        ),
        SizedBox(width: 15.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.text,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: ColorManager.blackColor, fontWeight: FontWeight.w600),
            ),
            Text(
              widget.value,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: ColorManager.greyColor),
            ),
          ],
        ),
        Spacer(),
        InkWell(
          onTap: widget.onTap,
          child: Text(
            AppStrings.edit,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  showMobileNumberBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: ColorManager.midWhiteColor,
        );
      },
    );
  }
}
