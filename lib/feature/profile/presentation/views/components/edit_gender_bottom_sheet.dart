import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/profile/presentation/controller/my_profile_provider.dart';

class EditGenderBottomSheet extends StatelessWidget {
  const EditGenderBottomSheet({
    super.key,
    required this.genderOptions,
  });

  final List<String> genderOptions;

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProfileProvider>(
      builder: (context, provider, child) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Container(
              height: 250.h,
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                CustomDropDownField(
                  selectedOption: provider.myProfileEntity.gender!,
                  options: genderOptions,
                  fieldName: AppLocalizations.of(context)!.gender,
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
      ),
    );
  }
}
