import 'package:bacura_app/core/providers/language_provider.dart';
import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SpCalender extends StatefulWidget {
  const SpCalender({super.key});

  @override
  State<SpCalender> createState() => _SpCalenderState();
}

class _SpCalenderState extends State<SpCalender> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LanguageProvider>(context);

    return Container(
        color: ColorManager.whiteColor,
        height: 365.h,
        padding: EdgeInsets.only(bottom: 12.h),
        child: Calendar(
            isExpandable: true,
            bottomBarColor: ColorManager.midWhiteColor,
            bottomBarTextStyle:
                Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.primaryBlueColor, fontSize: 18),
            bottomBarArrowColor: ColorManager.primaryBlueColor,
            initialDate: DateTime.now(),
            defaultOutOfMonthDayColor: ColorManager.greyColor,
            defaultDayColor: ColorManager.darkBlueColor,
            displayMonthTextStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: ColorManager.darkBlueColor,
                  fontWeight: FontWeight.bold,
                ),
            showEventListViewIcon: false,
            hideTodayIcon: true,
            weekDays: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
            selectedColor: ColorManager.primaryBlueColor,
            selectedTodayColor: ColorManager.primaryBlueColor,
            todayColor: ColorManager.primaryBlueColor,
            locale: '${provider.appLanguage}_SA',
            topRowIconColor: ColorManager.primaryBlueColor,
            isExpanded: true,
            expandableDateFormat: 'EEEE, dd. MMMM yyyy',
            datePickerType: DatePickerType.year,
            dayOfWeekStyle: TextStyle(color: ColorManager.primaryBlueColor, fontWeight: FontWeight.bold, fontSize: 15),
            onMonthChanged: (DateTime date) {
              setState(() {
                // Update state or handle actions when the month changes
              });
            }));
  }
}
