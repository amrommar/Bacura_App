import 'package:bacura_app/core/utils/index.dart';

class RegisterInstitutionScreen extends StatefulWidget {
  const RegisterInstitutionScreen({super.key});

  @override
  State<RegisterInstitutionScreen> createState() => _RegisterInstitutionScreenState();
}

class _RegisterInstitutionScreenState extends State<RegisterInstitutionScreen> {
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
        imagePath: 'assets/images/png/personal-information.png',
        content: const Text('تسجيل البيانات بنجاح '),
        onCancel: () {
          Navigator.of(context).pop();
        },
        onOk: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
              ModalRoute.withName(Routes.homeRoute)); // Will remove all routes until this one
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
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.register_institution),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: AppSizes.ph8, horizontal: AppSizes.pw24),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey, // Attach form key
            child: Column(
              children: [
                SizedBox(height: AppSizes.ph10),
                Text(
                  AppLocalizations.of(context)!.register_as_partner,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: ColorManager.blackColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(height: AppSizes.ph10),
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
                SizedBox(height: AppSizes.ph5),
                RegisterPhoneField(
                  hintText: AppLocalizations.of(context)!.mobileNumber,
                  controller: _phoneController,
                ),
                SizedBox(height: AppSizes.ph10),
                CityDropDownWidget(
                  selectedOption: _selectedCity,
                  options: const ['Riyad', 'Jedda'],
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedCity = newValue!;
                    });
                  },
                ),
                SizedBox(height: AppSizes.ph6),
                UploadImageFieldIcon(
                  label: AppLocalizations.of(context)!.commercial_registration_image,
                ),
                SizedBox(height: AppSizes.ph10),
                TermsConditionsCheck(
                  value: _termsAccepted,
                  onChanged: (value) {
                    setState(() {
                      _termsAccepted = value!;
                    });
                  },
                ),
                SizedBox(height: AppSizes.ph100),
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
      ),
    );
  }
}
