import 'package:bacura_app/feature/my_requests/presentation/controller/my_requests_provider.dart';
import 'package:bacura_app/feature/my_requests/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bacura_app/core/utils/index.dart';

class RequestsFilterWidget extends StatelessWidget {
  const RequestsFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final myRequestsProvider = Provider.of<MyRequestsProvider>(context);

    final List<MultiSelectItem<String>> filterItems = requestsTypes.map((filter) {
      String translatedFilter = '';
      switch (filter) {
        case 'pending':
          translatedFilter = AppLocalizations.of(context)!.pending;
          break;
        case 'ongoing':
          translatedFilter = AppLocalizations.of(context)!.on_going;
          break;
        case 'completed':
          translatedFilter = AppLocalizations.of(context)!.completed;
          break;
        case 'canceled':
          translatedFilter = AppLocalizations.of(context)!.canceled;
          break;
        default:
          translatedFilter = filter;
      }
      return MultiSelectItem<String>(filter, translatedFilter);
    }).toList();

    void showMultiSelect() async {
      await showDialog(
        context: context,
        builder: (ctx) {
          return MultiSelectDialog(
            checkColor: ColorManager.whiteColor,
            height: AppSizes.ph240,
            backgroundColor: ColorManager.lightBlueColor,
            title: Text(AppLocalizations.of(context)!.select_category),
            itemsTextStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorManager.greyColor),
            selectedColor: ColorManager.primaryBlueColor,
            items: filterItems,
            initialValue: myRequestsProvider.selectedFilters,
            onConfirm: (List<String> selectedValues) {
              myRequestsProvider.setSelectedFilters(selectedValues);
            },
          );
        },
      );
    }

    return Container(
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Filter_Icon(onTap: showMultiSelect),
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ...myRequestsProvider.selectedFilters.map((selected) {
                return SelectedFilterWidgets(text: translateFilter(selected, context));
              }),
              ...requestsTypes.where((type) => !myRequestsProvider.selectedFilters.contains(type)).map((unselected) {
                return UnSelected_Filter_Container(text: translateFilter(unselected, context));
              }),
            ],
          )),
        ],
      ),
    );
  }
}
