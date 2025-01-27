import 'package:bacura_app/core/utils/index.dart';

class RegisterTechnicianScreen extends StatefulWidget {
  const RegisterTechnicianScreen({super.key});

  @override
  State<RegisterTechnicianScreen> createState() => _RegisterTechnicianScreenState();
}

class _RegisterTechnicianScreenState extends State<RegisterTechnicianScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
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
      showCustomDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.register_technician),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: AppSizes.ph8, horizontal: AppSizes.pw24),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: AppSizes.ph10),
                Text(
                  AppLocalizations.of(context)!.register_as_technician,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: ColorManager.blackColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(height: AppSizes.ph10),
                CustomRegistrationTextField(
                  hintText: AppLocalizations.of(context)!.technician_name,
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)!.pleaseEnterYourName;
                    }
                    return null;
                  },
                ),
                CustomRegistrationTextField(
                  hintText: AppLocalizations.of(context)!.id_number,
                  controller: _idController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)!.please_enter_id_number;
                    }
                    if (value.length != 10) {
                      return AppLocalizations.of(context)!.invalid_id_number;
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
                UploadImageWidget(label: AppLocalizations.of(context)!.identity_image),
                SizedBox(height: AppSizes.ph10),
                UploadImageWidget(label: AppLocalizations.of(context)!.personal_image),
                SizedBox(height: AppSizes.ph10),
                TermsConditionsCheck(
                  value: _termsAccepted,
                  onChanged: (value) {
                    setState(() {
                      _termsAccepted = value!;
                    });
                  },
                ),
                SizedBox(height: AppSizes.ph60),
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
