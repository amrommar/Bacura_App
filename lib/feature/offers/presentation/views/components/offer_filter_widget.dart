import 'package:bacura_app/core/utils/index.dart';

class OfferFilterWidget extends StatefulWidget {
  const OfferFilterWidget({super.key});

  @override
  State<OfferFilterWidget> createState() => _ordersFilterState();
}

class _ordersFilterState extends State<OfferFilterWidget> {
  List<String> selectedFilters = [];

  @override
  Widget build(BuildContext context) {
    final List<String> filterTitles = [];

    final List<MultiSelectItem<String>> filterItems =
        filterTitles.map((filter) => MultiSelectItem<String>(filter, filter)).toList();

    void showMultiSelect() async {
      await showDialog(
        context: context,
        builder: (ctx) {
          return MultiSelectDialog(
            checkColor: ColorManager.whiteColor,
            height: AppSizes.ph380,
            backgroundColor: ColorManager.lightBlueColor,
            title: Text(
              tr(AppStrings.selectCategory),
            ),
            itemsTextStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: ColorManager.greyColor,
                ),
            selectedColor: ColorManager.primaryBlueColor,
            items: filterItems,
            initialValue: selectedFilters,
            onConfirm: (List<String> selectedValues) {
              setState(() {
                selectedFilters = selectedValues;
              });
            },
          );
        },
      );
    }

    return Container(
      height: AppSizes.ph50,
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.pw4,
        vertical: AppSizes.ph4,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Filter Icon
          FilterIcon(
            onTap: showMultiSelect,
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...selectedFilters.map((selected) {
                  return SelectedFilterWidgets(
                    text: selected,
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
                ...filterTitles.where((filter) => !selectedFilters.contains(filter)).map((unselected) {
                  return UnSelectedFilterContainer(text: unselected);
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
