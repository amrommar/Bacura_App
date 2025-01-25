import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/profile/presentation/controller/my_profile_provider.dart';

class EditNameBottomSheet extends StatelessWidget {
  const EditNameBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Consumer<MyProfileProvider>(
      builder: (context, provider, child) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextFormField(
                  fieldName: AppLocalizations.of(context)!.fullName,
                  hintText: AppLocalizations.of(context)!.enterYourName,
                  controller: provider.nameController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return AppLocalizations.of(context)!.pleaseEnterYourName;
                    }
                    return null;
                  },
                ),
                SizedBox(height: 40.h),
                CustomSmallElevatedButton(
                  text: AppLocalizations.of(context)!.save,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      print('name: ${provider.nameController.text}');
                      provider.updateMyProfile();

                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
