import 'package:bacura_app/presentation/homeScreen/Offers_tab/custom_filter_container.dart';
import 'package:bacura_app/presentation/homeScreen/Offers_tab/custom_offer_container.dart';
import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:bacura_app/presentation/resources/routes_manager.dart';
import 'package:bacura_app/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import '../../resources/strings_manager.dart';

class Offers_Tab extends StatefulWidget {
  const Offers_Tab({super.key});

  @override
  State<Offers_Tab> createState() => _Offers_TabState();
}

class _Offers_TabState extends State<Offers_Tab> {
  /////////////////////////////////////              From Back-End          ////////////////
  static List<String> filterTitles = [
    AppStrings.security_and_monitoring,
    AppStrings.smartSystems,
    AppStrings.accessControl,
    AppStrings.soundSystems,
    AppStrings.saveEnergy,
    AppStrings.networks_communications,
    AppStrings.gameMaintenance,
    AppStrings.computerMaintenance,
    AppStrings.phoneMaintenance,
  ];
  final List<MultiSelectItem<String>> _filterItems =
      filterTitles.map((filter) => MultiSelectItem<String>(filter, filter)).toList();
  List<String> _selectedFilters = [];

  void _showMultiSelect() async {
    await showDialog(
      context: context,
      builder: (ctx) {
        return MultiSelectDialog(
          checkColor: ColorManager.whiteColor,
          height: 550.h,

          backgroundColor: ColorManager.lightBlueColor,
          title: Text(AppLocalizations.of(context)!.select_category),
          itemsTextStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorManager.greyColor),
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
    return Container(
        color: ColorManager.whiteColor,
        child: Column(children: [
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
                _selectedFilters.isEmpty
                    ? Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: filterTitles.length,
                            itemBuilder: (context, index) {
                              return UnSelected_Filter_Container(
                                text: filterTitles[index],
                              );
                            }))
                    : Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _selectedFilters.length,
                            itemBuilder: (context, index) {
                              return Selected_Filter_Container(text: _selectedFilters[index]);
                            }))
              ])),

          Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p6),
              child: Divider(color: ColorManager.lightBlueColor)),

          /// Offer List section ///////////////////////////////////////////////////////
          Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.offerDetailsRoute);
                        },
                        child: Custom_Offer_container());
                  }))
        ]));
  }
}
