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
          translatedFilter = tr(AppStrings.approved);
          break;
        case 'confirmed':
          translatedFilter = tr(AppStrings.confirmed);
          break;
        case 'completed':
          translatedFilter = tr(AppStrings.completed);
          break;
        case 'declined':
          translatedFilter = tr(AppStrings.cancelled);
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
            title: Text(
              tr(AppStrings.selectCategory),
              style: Theme.of(context).textTheme.titleSmall,
            ),
            itemsTextStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: ColorManager.greyColor,
                ),
            cancelText: Text(
              tr(AppStrings.cancel),
              style: Theme.of(context).textTheme.titleSmall,
            ),
            confirmText: Text(
              tr(AppStrings.ok),
              style: Theme.of(context).textTheme.titleSmall,
            ),
            selectedItemsTextStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: ColorManager.blackColor,
                  fontWeight: FontWeight.bold,
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
                              : selected == 'confirmed'
                                  ? ColorManager.yellowColor
                                  : ColorManager.darkRedColor,
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
