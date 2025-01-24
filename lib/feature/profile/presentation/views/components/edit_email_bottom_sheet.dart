import 'package:bacura_app/core/utils/index.dart';

class EditEmailBottomSheet extends StatelessWidget {
  const EditEmailBottomSheet({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(20),
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
                    final bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(text);
                    if (!emailValid) {
                      return AppLocalizations.of(context)!.please_enter_valid_email;
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20.h),
              CustomSmallElevatedButton(
                  text: AppLocalizations.of(context)!.save,
                  onPressed: () {
                    if (formKey.currentState!.validate() == true) {
                      Navigator.pop(context);
                    }
                  })
            ])),
      ),
    );
  }
}
