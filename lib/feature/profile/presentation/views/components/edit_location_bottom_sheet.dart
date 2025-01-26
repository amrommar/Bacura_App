import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/profile/presentation/controller/my_profile_provider.dart';

class EditLocationBottomSheet extends StatelessWidget {
  const EditLocationBottomSheet({
    super.key,
    required this.cityOptions,
  });

  final List<String> cityOptions;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<MyProfileProvider>(builder: (context, provider, child) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.pw20,
            vertical: AppSizes.ph30,
          ),
          child: Column(
            children: [
              CustomDropDownField(
                selectedOption: provider.myProfileEntity.location!,
                options: cityOptions,
                fieldName: AppLocalizations.of(context)!.city,
                onChanged: (String? newValue) {
                  if (newValue == null) {
                    return;
                  }
                  provider.selectedCity = newValue;
                },
              ),
              SizedBox(height: AppSizes.ph40),
              CustomSmallElevatedButton(
                  text: AppLocalizations.of(context)!.save,
                  onPressed: () {
                    /////////////////////// Method to save changes //////////////////////
                    provider.updateMyProfile();
                    Navigator.pop(context);
                  })
            ],
          ),
        );
      }),
    );
  }
}
