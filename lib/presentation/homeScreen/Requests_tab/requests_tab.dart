import 'package:bacura_app/presentation/homeScreen/Offers_tab/custom_filter_container.dart';
import 'package:bacura_app/presentation/homeScreen/Requests_tab/custom_request_container.dart';
import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:bacura_app/presentation/resources/routes_manager.dart';
import 'package:bacura_app/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
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
    ColorManager.redColor,
  ];
  static List<String> requestsTypes = [
    'On Going',
    'Completed',
    'Canceled',
    'On hold',
  ];
  final List<MultiSelectItem<String>> _filterItems = requestsTypes
      .map((filter) => MultiSelectItem<String>(filter, filter))
      .toList();
  List<String> _selectedFilters = [];

  void _showMultiSelect() async {
    await showDialog(
      context: context,
      builder: (ctx) {
        return MultiSelectDialog(
          checkColor: ColorManager.whiteColor,
          height: 220.h,

          backgroundColor: ColorManager.lightBlueColor,
          title: Text('Select Category'),
          itemsTextStyle: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: ColorManager.greyColor),
          selectedColor: ColorManager.primaryBlueColor,
          items: _filterItems,
          initialValue: _selectedFilters,
          // Initial selected filters
          onConfirm: (List<String> selectedValues) {
            setState(() {
              _selectedFilters = selectedValues;
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 5.h),

        /// filtering section ///////////////////////////////////////////////////////
        Container(
          height: 46.h,
          padding: const EdgeInsets.all(AppPadding.p4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Custom_Filter_Container(
                    child: InkWell(
                  onTap: () {
                    return _showMultiSelect();
                  },
                  child: Icon(
                    Icons.filter_list_outlined,
                    color: ColorManager.darkBlueColor,
                  ),
                )),
              ),
              SizedBox(width: 5.w),

              /// filter types section /////////////////////////////////////////////
              _selectedFilters.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Custom_Filter_Container(
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppPadding.p8),
                              child: Text('All Requests are on display',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: ColorManager.darkBlueColor)))),
                    )
                  : Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _selectedFilters.length,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppPadding.p2, vertical: 2),
                              child: Custom_Filter_Container(
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: AppPadding.p4),
                                      child: Text(_selectedFilters[index],
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  color: ColorManager
                                                      .darkBlueColor)))));
                        },
                      ),
                    )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p6),
          child: Divider(color: ColorManager.lightBlueColor),
        ),
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
                ),
              );
            },
          ),
        ),
      ],
    );
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

class RequestDetailsArguments {
  final Color color;

  RequestDetailsArguments(this.color);
}
