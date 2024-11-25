import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/color_manager.dart';

class SpPersonalRowDetails extends StatefulWidget {
  IconData icon;
  String text;
  String value;

  SpPersonalRowDetails({
    super.key,
    required this.icon,
    required this.text,
    required this.value,
  });

  @override
  State<SpPersonalRowDetails> createState() => _SpPersonalRowDetailsState();
}

class _SpPersonalRowDetailsState extends State<SpPersonalRowDetails> {
  ////// Custom Row contain: (Icon - Column : 'text / text' - text)/////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(
        widget.icon,
        color: ColorManager.primaryBlueColor,
        size: 30,
      ),
      SizedBox(width: 30.w),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(widget.text,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: ColorManager.blackColor,
                  fontWeight: FontWeight.w600,
                )),
        Text(widget.value,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: ColorManager.greyColor,
                ))
      ]),
    ]);
  }
}
