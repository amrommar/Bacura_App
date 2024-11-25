import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/feature/offers/presentation/views/widgets/custom_filter_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class RequestsFilter extends StatefulWidget {
  const RequestsFilter({super.key});

  @override
  State<RequestsFilter> createState() => _RequestsFilterState();
}

class _RequestsFilterState extends State<RequestsFilter> {
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

    return Container(
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
        ]));
  }
}
