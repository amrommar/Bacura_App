import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/profile/presentation/controller/my_profile_provider.dart';

class EditEmailBottomSheet extends StatelessWidget {
  const EditEmailBottomSheet({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return SingleChildScrollView(
      child: Consumer<MyProfileProvider>(
        builder: (context, provider, child) => Container(
            padding: EdgeInsets.all(AppSizes.ph20),
            child: Column(children: [
              Form(
                key: formKey,
                child: CustomTextFormField(
                  fieldName: AppLocalizations.of(context)!.email,
                  hintText: AppLocalizations.of(context)!.email,
                  controller: emailController,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return AppLocalizations.of(context)!.enter_your_email;
                    }
                    final bool emailValid =
                        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(text);
                    if (!emailValid) {
                      return AppLocalizations.of(context)!.please_enter_valid_email;
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: AppSizes.ph40),
              CustomSmallElevatedButton(
                  text: AppLocalizations.of(context)!.save,
                  onPressed: () {
                    if (formKey.currentState!.validate() == true) {
                      provider.updateMyProfile();
                      Navigator.pop(context);
                    }
                  })
            ])),
      ),
    );
  }
}
