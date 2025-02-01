import 'package:bacura_app/core/utils/index.dart';

class RequestsFilterWidget extends StatefulWidget {
  const RequestsFilterWidget({super.key});

  @override
  State<RequestsFilterWidget> createState() => _RequestsFilterWidgetState();
}

class _RequestsFilterWidgetState extends State<RequestsFilterWidget> {
  List<String> selectedFilters = [];

  @override
  Widget build(BuildContext context) {
    List<String> requestsTypes = [
      AppLocalizations.of(context)!.on_going,
      AppLocalizations.of(context)!.completed,
      AppLocalizations.of(context)!.canceled,
      AppLocalizations.of(context)!.pending,
    ];
    final List<MultiSelectItem<String>> _filterItems =
        requestsTypes.map((filter) => MultiSelectItem<String>(filter, filter)).toList();
    void _showMultiSelect() async {
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Filter_Icon(onTap: () {
            return _showMultiSelect();
          }),

          /// Filter types section
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                // Render selected filters
                ...selectedFilters.map((selected) {
                  return SelectedFilterWidgets(text: selected);
                }),

                // Render unselected filters
                ...requestsTypes.where((type) => !selectedFilters.contains(type)).map((unselected) {
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
