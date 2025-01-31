import 'package:bacura_app/core/utils/index.dart';

class CustomDropDownField extends StatefulWidget {
  final String selectedOption;
  final List<String> options;
  final String fieldName;
  final Function(String?)? onChanged;

  const CustomDropDownField({
    super.key,
    required this.selectedOption,
    required this.options,
    required this.fieldName,
    this.onChanged,
  });

  @override
  State<CustomDropDownField> createState() => _CustomDropDownFieldState();
}

class _CustomDropDownFieldState extends State<CustomDropDownField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: AppSizes.ph10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            widget.fieldName,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.blackColor),
          ),
          SingleChildScrollView(
            child: DropdownButtonFormField<String>(
                value: widget.selectedOption,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.blue),
                // Text style for selected option
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                      left: AppSizes.pw8, right: AppSizes.pw8, top: AppSizes.ph8, bottom: AppSizes.ph20),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorManager.lightGreyColor,
                        width: AppSizes.pw1,
                      ),
                      borderRadius: BorderRadius.circular(AppSizes.br8)),
                ),
                dropdownColor: ColorManager.whiteColor,
                iconEnabledColor: ColorManager.primaryBlueColor,

                // Background color of the dropdown list
                items: widget.options.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(
                      option,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: ColorManager.darkBlueColor,
                          ), // Text style for dropdown items
                    ),
                  );
                }).toList(),
                onChanged: widget.onChanged),
          ),
        ]));
  }
}
