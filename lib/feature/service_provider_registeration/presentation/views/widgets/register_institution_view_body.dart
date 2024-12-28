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
  RegisterInstitutionViewBody({super.key});

  @override
  State<RegisterInstitutionViewBody> createState() => _RegisterInstitutionViewBodyState();
}

class _RegisterInstitutionViewBodyState extends State<RegisterInstitutionViewBody> {
  TextEditingController controller = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Text(AppLocalizations.of(context)!.register_as_partner,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: ColorManager.blackColor,
                      fontWeight: FontWeight.bold,
                    )),
            const SizedBox(height: 10),
            CustomRegistrationTextField(
              hintText: AppLocalizations.of(context)!.responsible_name,
            ),
            CustomRegistrationTextField(
              hintText: AppLocalizations.of(context)!.commercial_registration_number,
            ),
            const SizedBox(height: 5),
            RegisterPhoneField(
              hintText: AppLocalizations.of(context)!.mobileNumber,
              controller: controller,
            ),
            const SizedBox(height: 10),
            CityDropDownField(
              selectedOption: 'Riyad',
              options: const ['Riyad', 'Jedda'],
            ),
            const SizedBox(height: 6),
            UploadImageFieldIcon(
              label: AppLocalizations.of(context)!.commercial_registration_image,
            ),
            const SizedBox(height: 10),
            const TermsConditionsCheck(),
            const SizedBox(height: 100),
            const SizedBox(height: 10),
            Center(
                child: ElevatedButton(
                    onPressed: () {
                      showCustomDialog(context);
                    },
                    child: Text(
                      AppLocalizations.of(context)!.send_request,
                      style: Theme.of(context).textTheme.titleMedium,
                    ))),
          ],
        ),
      ),
    );
  }
}
