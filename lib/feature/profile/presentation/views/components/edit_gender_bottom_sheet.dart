import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/profile/presentation/controller/my_profile_provider.dart';

class EditGenderBottomSheet extends StatelessWidget {
  const EditGenderBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProfileProvider>(
      builder: (context, provider, child) => SingleChildScrollView(
        child: Container(
            height: AppSizes.ph250,
            padding: EdgeInsets.all(AppSizes.ph20),
            child: Column(children: [
              CustomDropDownField(
                selectedOption: provider.myProfileEntity.gender == 'male' ? tr(AppStrings.male) : tr(AppStrings.female),
                options: [tr(AppStrings.male), tr(AppStrings.female)],
                fieldName: tr(AppStrings.gender),
                onChanged: (String? newValue) {
                  if (newValue == null) {
                    return;
                  }
                  newValue == 'ذكر' ? provider.selectedGender = 'male' : provider.selectedGender = 'female';
                },
              ),
              SizedBox(height: AppSizes.ph20),
              CustomSmallElevatedButton(
                  text: tr(AppStrings.save),
                  onPressed: () {
                    /////////////////////// Method to save changes //////////////////////
                    provider.updateMyProfile();
                    Navigator.pop(context);
                  })
            ])),
      ),
    );
  }
}
