import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/my_orders/presentation/controller/my_order_provider.dart';
import 'package:bacura_app/feature/my_orders/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ordersFilterWidget extends StatelessWidget {
  const ordersFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final myOrdersProvider = Provider.of<MyOrderProvider>(context);

    final List<MultiSelectItem<String>> filterItems = ordersTypes.map((filter) {
      String translatedFilter = '';
      switch (filter) {
        case 'pending':
          translatedFilter = AppLocalizations.of(context)!.pending;
          break;
        case 'approved':
          translatedFilter = AppLocalizations.of(context)!.on_going;
          break;
        case 'completed':
          translatedFilter = AppLocalizations.of(context)!.completed;
          break;
        case 'declined':
          translatedFilter = AppLocalizations.of(context)!.canceled;
          break;
        case 'confirmed':
          translatedFilter = 'معتمدة';
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
            initialValue: myOrdersProvider.selectedFilters,
            onConfirm: (List<String> selectedValues) {
              myOrdersProvider.setSelectedFilters(selectedValues);
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
              ...myOrdersProvider.selectedFilters.map((selected) {
                return SelectedFilterWidgets(text: translateFilter(selected, context));
              }),
              ...ordersTypes.where((type) => !myOrdersProvider.selectedFilters.contains(type)).map((unselected) {
                return UnSelected_Filter_Container(text: translateFilter(unselected, context));
              }),
            ],
          )),
        ],
      ),
    );
  }
}
