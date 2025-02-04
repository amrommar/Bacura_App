import 'package:bacura_app/core/utils/index.dart';

class OfferFilterWidget extends StatefulWidget {
  const OfferFilterWidget({super.key});

  @override
  State<OfferFilterWidget> createState() => _RequestsFilterState();
}

class _RequestsFilterState extends State<OfferFilterWidget> {
  List<String> selectedFilters = [];

  @override
  Widget build(BuildContext context) {
    final List<String> filterTitles = [
      AppLocalizations.of(context)!.surveillance_cameras,
      AppLocalizations.of(context)!.smart_systems,
      AppLocalizations.of(context)!.access_control,
      AppLocalizations.of(context)!.sound_systems,
      AppLocalizations.of(context)!.save_energy,
      AppLocalizations.of(context)!.internet_communications_networks,
    ];

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
            title: Text(AppLocalizations.of(context)!.select_category),
            itemsTextStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorManager.greyColor),
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
      padding: EdgeInsets.symmetric(horizontal: AppSizes.pw4, vertical: AppSizes.ph4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Filter Icon
          Filter_Icon(
            onTap: showMultiSelect,
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...selectedFilters.map((selected) {
                  return SelectedFilterWidgets(text: selected);
                }),
                ...filterTitles.where((filter) => !selectedFilters.contains(filter)).map((unselected) {
                  return UnSelected_Filter_Container(text: unselected);
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
