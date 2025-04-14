import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/my_orders/presentation/controller/my_order_provider.dart';
import 'package:bacura_app/feature/my_orders/utils.dart';

class ordersFilterWidget extends StatelessWidget {
  const ordersFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final myOrdersProvider = Provider.of<MyOrderProvider>(context);

    final List<MultiSelectItem<String>> filterItems = ordersTypes.map((filter) {
      String translatedFilter = '';
      switch (filter) {
        case 'pending':
          translatedFilter = tr(AppStrings.pending);
          break;
        case 'approved':
          translatedFilter = tr(AppStrings.onGoing);
          break;
        case 'completed':
          translatedFilter = tr(AppStrings.completed);
          break;
        case 'declined':
          translatedFilter = tr(AppStrings.cancelled);
          break;
        case 'confirmed':
          translatedFilter = tr(AppStrings.confirmed);
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
            title: Text(tr(AppStrings.selectCategory)),
            itemsTextStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: ColorManager.greyColor,
                ),
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
          FilterIcon(onTap: showMultiSelect),
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ...myOrdersProvider.selectedFilters.map((selected) {
                return SelectedFilterWidgets(
                  text: translateFilter(selected, context),
                  backgroundColor: selected == 'pending'
                      ? ColorManager.primaryBlueColor
                      : selected == 'approved'
                          ? ColorManager.orangeColor
                          : selected == 'completed'
                              ? ColorManager.darkGreenColor
                              : selected == 'declined'
                                  ? ColorManager.darkRedColor
                                  : ColorManager.yellowColor,
                );
              }),
              ...ordersTypes.where((type) => !myOrdersProvider.selectedFilters.contains(type)).map((unselected) {
                return UnSelectedFilterContainer(text: translateFilter(unselected, context));
              }),
            ],
          )),
        ],
      ),
    );
  }
}
