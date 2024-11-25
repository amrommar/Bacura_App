import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/color_manager.dart';

class PersonalRowDetails extends StatefulWidget {
  IconData icon;
  String text;
  String value;
  Function() onTap;

  PersonalRowDetails({
    super.key,
    required this.icon,
    required this.onTap,
    required this.text,
    required this.value,
  });

  @override
  State<PersonalRowDetails> createState() => _PersonalRowDetailsState();
}

class _PersonalRowDetailsState extends State<PersonalRowDetails> {
  ////// Custom Row contain: (Icon - Column : 'text / text' - text)/////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(widget.icon, color: ColorManager.primaryBlueColor, size: 30),
      SizedBox(width: 15.w),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(widget.text,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: ColorManager.blackColor, fontWeight: FontWeight.w600)),
        Text(widget.value,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: ColorManager.greyColor,
                ))
      ]),
      const Spacer(),
      InkWell(
          onTap: widget.onTap,
          child: Text(AppLocalizations.of(context)!.edit,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  )))
    ]);
  }
}
