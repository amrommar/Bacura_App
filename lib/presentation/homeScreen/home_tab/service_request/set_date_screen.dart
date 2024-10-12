import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/questions_%20continue_bottomsheet.dart';
import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:bacura_app/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SetDate_Screen extends StatefulWidget {
  @override
  State<SetDate_Screen> createState() => _SetDate_ScreenState();
}

class _SetDate_ScreenState extends State<SetDate_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Set Date & Time'),
      ),
      body: Column(
        children: [
          /// Calender section /////////////////////////////////////
          Expanded(
              child: Container(
            margin: EdgeInsets.only(top: 1.h),
            decoration: BoxDecoration(
                color: ColorManager.primaryBlueColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16))),
            child: Calendar(
              isExpandable: true,
              bottomBarColor: ColorManager.whiteColor,
              bottomBarTextStyle: Theme.of(context).textTheme.titleSmall,
              bottomBarArrowColor: ColorManager.primaryBlueColor,
              initialDate: DateTime.now(),
              defaultOutOfMonthDayColor: ColorManager.lightGreyColor,
              defaultDayColor: ColorManager.whiteColor,
              displayMonthTextStyle: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: ColorManager.whiteColor),
              showEventListViewIcon: false,
              hideTodayIcon: true,
              weekDays: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
              selectedColor: ColorManager.darkBlueColor,
              selectedTodayColor: ColorManager.darkBlueColor,
              todayColor: ColorManager.darkBlueColor,
              locale: 'en_US',
              topRowIconColor: ColorManager.whiteColor,
              isExpanded: true,
              expandableDateFormat: 'EEEE, dd. MMMM yyyy',
              datePickerType: DatePickerType.date,
              dayOfWeekStyle: TextStyle(
                  color: ColorManager.whiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
              onMonthChanged: (DateTime date) {
                // Trigger any action on month change if needed
                setState(() {
                  // Update state or handle actions when the month changes
                });
              },
            ),
          )),

          /// Set Time Section ////////////////////////////////////
          Container(
            height: 250.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Time_Container(text: '9 - 11'),
                    Time_Container(text: '11 - 1'),
                    Time_Container(text: '1 - 3'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Time_Container(text: '3 - 5'),
                    Time_Container(text: '5 - 7'),
                    Time_Container(text: '7 - 9'),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),

          Custom_ElevatedButton(
            onTap: () {
              showQuestionsBottomSheet();
            },
          ),
          SizedBox(height: 100.h),
        ],
      ),
    );
  }

  void showQuestionsBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Questions_BottomSheet();
      },
    );
  }
}

/// Next ElevatedButton Section ////////////////////////////////////
class Custom_ElevatedButton extends StatelessWidget {
  Function onTap;

  Custom_ElevatedButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              maximumSize: Size(170.w, 70),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s8))),
          onPressed: () {
            onTap();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Next',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorManager.whiteColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 10.w),
              Icon(Icons.arrow_circle_right_outlined,
                  color: ColorManager.whiteColor)
            ],
          )),
    );
  }
}

class Time_Container extends StatelessWidget {
  String text;

  Time_Container({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.only(left: 12.w, top: 8.h, right: 12.w),
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ColorManager.lightBlueColor,
              // Shadow color with opacity
              spreadRadius: 2, // Spread radius
              blurRadius: 4, // Blur radius
              offset: Offset(0, 3), // Offset in the x and y directions
            ),
          ],
          borderRadius: BorderRadius.circular(AppSize.s8),
          color: ColorManager.whiteColor),
      child: Center(
        child: Text(text,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: ColorManager.blackColor)),
      ),
    );
  }
}
