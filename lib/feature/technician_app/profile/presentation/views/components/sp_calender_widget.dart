import 'package:bacura_app/core/utils/index.dart';

class SpCalenderWidget extends StatefulWidget {
  const SpCalenderWidget({super.key});

  @override
  State<SpCalenderWidget> createState() => _SpCalenderWidgetState();
}

class _SpCalenderWidgetState extends State<SpCalenderWidget> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LanguageProvider>(context);

    return Container(
        color: ColorManager.whiteColor,
        height: AppSizes.ph365,
        padding: EdgeInsets.only(bottom: AppSizes.ph12),
        child: Calendar(
            isExpandable: true,
            bottomBarColor: ColorManager.midWhiteColor,
            bottomBarTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: ColorManager.primaryBlueColor,
                  fontSize: AppSizes.sp18,
                ),
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
            dayOfWeekStyle: TextStyle(
              color: ColorManager.primaryBlueColor,
              fontWeight: FontWeight.bold,
              fontSize: AppSizes.sp15,
            ),
            onMonthChanged: (DateTime date) {
              setState(() {
                // Update state or handle actions when the month changes
              });
            }));
  }
}
