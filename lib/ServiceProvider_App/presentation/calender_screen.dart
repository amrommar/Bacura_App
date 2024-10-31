import 'package:bacura_app/ServiceProvider_App/presentation/wigdets/sp_calender_request.dart';
import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:bacura_app/providers/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Calender_Screen extends StatefulWidget {
  @override
  State<Calender_Screen> createState() => _Calender_ScreenState();
}

class _Calender_ScreenState extends State<Calender_Screen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
        appBar: AppBar(title: Text('التقويم'), elevation: 0),
        body: Column(children: [
          Container(
              color: ColorManager.whiteColor,
              height: 365.h,
              padding: EdgeInsets.only(bottom: 12.h),
              child: Calendar(
                  isExpandable: true,
                  bottomBarColor: ColorManager.midWhiteColor,
                  bottomBarTextStyle: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: ColorManager.primaryBlueColor, fontSize: 18),
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
                  dayOfWeekStyle:
                      TextStyle(color: ColorManager.primaryBlueColor, fontWeight: FontWeight.bold, fontSize: 15),
                  onMonthChanged: (DateTime date) {
                    setState(() {
                      // Update state or handle actions when the month changes
                    });
                  })),
          Expanded(
              child: Container(
            color: ColorManager.midWhiteColor,
            child: ListView.builder(
                itemCount: 12,
                itemBuilder: (context, index) {
                  return InkWell(onTap: () {}, child: SP_CalenderRequestContainer());
                }),
          )),
        ]));
  }
}
