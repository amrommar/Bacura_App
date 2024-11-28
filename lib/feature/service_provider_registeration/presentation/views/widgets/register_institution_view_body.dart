import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/feature/service_provider_registeration/presentation/views/widgets/city_drop_down_field.dart';
import 'package:bacura_app/feature/service_provider_registeration/presentation/views/widgets/custom_registration_text_field.dart';
import 'package:bacura_app/feature/service_provider_registeration/presentation/views/widgets/register_phone_field.dart';
import 'package:bacura_app/feature/service_provider_registeration/presentation/views/widgets/terms_conditions_check.dart';
import 'package:bacura_app/feature/service_provider_registeration/presentation/views/widgets/upload_image_field_icon.dart';
import 'package:flutter/material.dart';

class RegisterInstitutionViewBody extends StatelessWidget {
  RegisterInstitutionViewBody({super.key});

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Text('Register As a Partner',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: ColorManager.blackColor,
                      fontWeight: FontWeight.bold,
                    )),
            const SizedBox(height: 10),
            CustomRegistrationTextField(hintText: 'Responsible Name*'),
            CustomRegistrationTextField(hintText: 'Commercial registration number*'),
            const SizedBox(height: 5),
            RegisterPhoneField(hintText: 'Mobile Number', controller: controller),
            const SizedBox(height: 10),
            CityDropDownField(selectedOption: 'Riyad', options: const ['Riyad', 'Jedda']),
            const SizedBox(height: 6),
            UploadImageFieldIcon(label: 'Commercial registration Image'),
            const SizedBox(height: 10),
            const TermsConditionsCheck(),
            const SizedBox(height: 100),
            const SizedBox(height: 10),
            Center(
                child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Send Request',
                      style: Theme.of(context).textTheme.titleMedium,
                    ))),
          ],
        ),
      ),
    );
  }
}
