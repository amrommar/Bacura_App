import 'package:bacura_app/presentation/homeScreen/Offers_tab/custom_filter_container.dart';
import 'package:bacura_app/presentation/homeScreen/Requests_tab/widgets/custom_request_container.dart';
import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:bacura_app/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

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
  static List<String> requestsTypes = [
    'جاري',
    'مكتمل',
    'ملغي',
    'قيد الانتظار',
  ];
  final List<MultiSelectItem<String>> _filterItems =
      requestsTypes.map((filter) => MultiSelectItem<String>(filter, filter)).toList();
  List<String> selectedFilters = [];

  @override
  Widget build(BuildContext context) {
    void _showMultiSelect() async {
      await showDialog(
          context: context,
          builder: (ctx) {
            return MultiSelectDialog(
                checkColor: ColorManager.whiteColor,
                height: 220.h,
                backgroundColor: ColorManager.lightBlueColor,
                title: Text(AppLocalizations.of(context)!.select_category),
                itemsTextStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorManager.greyColor),
                selectedColor: ColorManager.primaryBlueColor,
                items: _filterItems,
                initialValue: selectedFilters,
                // Initial selected filters
                onConfirm: (List<String> selectedValues) {
                  setState(() {
                    selectedFilters = selectedValues;
                  });
                });
          });
    }

    // int filterLength = (requestsTypes.length) - (selectedFilters.length);
    // requestsTypes.removeWhere((element) => selectedFilters.contains(element));
    // List<String> finalList = [...requestsTypes, ...selectedFilters];
    return Column(children: [
      SizedBox(height: 5.h),

      /// filtering section ///////////////////////////////////////////////////////
      Container(
          height: 50.h,
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Filter_Icon(onTap: () {
              return _showMultiSelect();
            }),

            /// filter types section /////////////////////////////////////////////
            selectedFilters.isEmpty
                ? Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: requestsTypes.length,
                        itemBuilder: (context, index) {
                          return UnSelected_Filter_Container(
                            text: requestsTypes[index],
                          );
                        }))
                : Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: selectedFilters.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Selected_Filter_Container(text: selectedFilters[index]),
                            ],
                          );
                        }),
                  )
          ])),
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
                    child: Custom_Request_Container(
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
