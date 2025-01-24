import 'package:bacura_app/core/utils/index.dart';

class EditLocationBottomSheet extends StatelessWidget {
  const EditLocationBottomSheet({
    super.key,
    required this.cityOptions,
  });

  final List<String> cityOptions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(children: [
              CustomDropDownField(
                selectedOption: 'الرياض',
                options: cityOptions,
                fieldName: AppLocalizations.of(context)!.city,
              ),
              SizedBox(height: 20.h),
              CustomSmallElevatedButton(
                  text: AppLocalizations.of(context)!.save,
                  onPressed: () {
                    /////////////////////// Method to save changes //////////////////////
                    Navigator.pop(context);
                  })
            ])),
      ),
    );
  }
}
