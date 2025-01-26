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
                selectedOption: provider.myProfileEntity.gender!,
                options: const ['male', 'female'],
                fieldName: AppLocalizations.of(context)!.gender,
                onChanged: (String? newValue) {
                  if (newValue == null) {
                    return;
                  }
                  provider.selectedGender = newValue;
                },
              ),
              SizedBox(height: AppSizes.ph20),
              CustomSmallElevatedButton(
                  text: AppLocalizations.of(context)!.save,
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
