import 'package:bacura_app/core/utils/DialogUtils.dart';
import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/core/utils/routes_manager.dart';
import 'package:bacura_app/feature/home/presentation/views/home_view.dart';
import 'package:bacura_app/feature/service_provider_registeration/presentation/views/widgets/city_drop_down_field.dart';
import 'package:bacura_app/feature/service_provider_registeration/presentation/views/widgets/custom_registration_text_field.dart';
import 'package:bacura_app/feature/service_provider_registeration/presentation/views/widgets/register_phone_field.dart';
import 'package:bacura_app/feature/service_provider_registeration/presentation/views/widgets/terms_conditions_check.dart';
import 'package:bacura_app/feature/service_provider_registeration/presentation/views/widgets/upload_image_field_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterInstitutionViewBody extends StatefulWidget {
  const RegisterInstitutionViewBody({super.key});

  @override
  State<RegisterInstitutionViewBody> createState() => _RegisterInstitutionViewBodyState();
}

class _RegisterInstitutionViewBodyState extends State<RegisterInstitutionViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Form key for validation
  final TextEditingController _responsibleNameController = TextEditingController();
  final TextEditingController _registrationNumberController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String _selectedCity = 'Riyad';
  bool _termsAccepted = false;

  void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(
        title: 'تأكيد',
        imagePath: 'assets/images/personal-information.png',
        content: Text('تسجيل البيانات بنجاح '),
        onCancel: () {
          Navigator.of(context).pop();
        },
        onOk: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeView(),
              ),
              ModalRoute.withName(Routes.homeScreenRoute)); // Will remove all routes until this one
        },
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (!_termsAccepted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: ColorManager.midRedColor,
            content: Text(AppLocalizations.of(context)!.please_enter_all_data),
            duration: const Duration(seconds: 1),
          ),
        );
        return;
      }

      // If all validations pass
      showCustomDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey, // Attach form key
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text(
                AppLocalizations.of(context)!.register_as_partner,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: ColorManager.blackColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 10),
              CustomRegistrationTextField(
                hintText: AppLocalizations.of(context)!.responsible_name,
                controller: _responsibleNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context)!.please_enter_responsible_name;
                  }
                  return null;
                },
              ),
              CustomRegistrationTextField(
                hintText: AppLocalizations.of(context)!.commercial_registration_number,
                controller: _registrationNumberController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context)!.please_enter_registration_number;
                  }
                  if (value.length != 10) {
                    return AppLocalizations.of(context)!.invalid_registration_number;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 5),
              RegisterPhoneField(
                hintText: AppLocalizations.of(context)!.mobileNumber,
                controller: _phoneController,
              ),
              const SizedBox(height: 10),
              CityDropDownField(
                selectedOption: _selectedCity,
                options: const ['Riyad', 'Jedda'],
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCity = newValue!;
                  });
                },
              ),
              const SizedBox(height: 6),
              UploadImageFieldIcon(
                label: AppLocalizations.of(context)!.commercial_registration_image,
              ),
              const SizedBox(height: 10),
              TermsConditionsCheck(
                value: _termsAccepted,
                onChanged: (value) {
                  setState(() {
                    _termsAccepted = value!;
                  });
                },
              ),
              const SizedBox(height: 100),
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text(
                    AppLocalizations.of(context)!.send_request,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
