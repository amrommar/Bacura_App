import 'package:bacura_app/core/utils/index.dart';

class OfferFilterSection extends StatefulWidget {
  @override
  State<OfferFilterSection> createState() => _RequestsFilterState();
}

class _RequestsFilterState extends State<OfferFilterSection> {
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

    final List<MultiSelectItem<String>> _filterItems =
        filterTitles.map((filter) => MultiSelectItem<String>(filter, filter)).toList();

    void _showMultiSelect() async {
      await showDialog(
        context: context,
        builder: (ctx) {
          return MultiSelectDialog(
            checkColor: ColorManager.whiteColor,
            height: 380.h,
            backgroundColor: ColorManager.lightBlueColor,
            title: Text(AppLocalizations.of(context)!.select_category),
            itemsTextStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorManager.greyColor),
            selectedColor: ColorManager.primaryBlueColor,
            items: _filterItems,
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
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Filter Icon
          Filter_Icon(
            onTap: _showMultiSelect,
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                // Selected Filters
                ...selectedFilters.map((selected) {
                  return Selected_Filter_Container(text: selected);
                }),

                // Unselected Filters
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
