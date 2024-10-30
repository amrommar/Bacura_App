import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:bacura_app/providers/language_provider.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
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
        appBar: AppBar(title: Text('التقويم')),
        body: Column(children: [
          Container(
              color: ColorManager.lightWhiteColor,
              padding: EdgeInsets.only(bottom: 12.h),
              child: EasyDateTimeLine(
                  locale: provider.appLanguage,
                  initialDate: DateTime.now(),
                  onDateChange: (date) {},
                  headerProps: EasyHeaderProps(
                    selectedDateStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.primaryBlueColor),
                    monthStyle: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.primaryBlueColor),
                    monthPickerType: MonthPickerType.switcher,
                    dateFormatter: DateFormatter.fullDateDMY(),
                  ),
                  dayProps: EasyDayProps(
                      todayStyle: DayStyle(
                          dayStrStyle:
                              Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorManager.darkBlueColor),
                          dayNumStyle:
                              Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.primaryBlueColor)),
                      inactiveDayStyle: DayStyle(
                          dayStrStyle: TextStyle(color: ColorManager.darkBlueColor),
                          dayNumStyle:
                              Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.primaryBlueColor)),
                      dayStructure: DayStructure.monthDayNumDayStr,
                      activeDayStyle: DayStyle(
                          decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            ColorManager.darkBlueColor,
                            ColorManager.midBlueColor,
                          ],
                        ),
                      ))))),
        ]));
  }
}
