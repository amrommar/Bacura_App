import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/feature/service_provider_registeration/presentation/views/widgets/city_drop_down_field.dart';
import 'package:bacura_app/feature/service_provider_registeration/presentation/views/widgets/custom_registration_text_field.dart';
import 'package:bacura_app/feature/service_provider_registeration/presentation/views/widgets/register_phone_field.dart';
import 'package:bacura_app/feature/service_provider_registeration/presentation/views/widgets/terms_conditions_check.dart';
import 'package:bacura_app/feature/service_provider_registeration/presentation/views/widgets/upload_image_field.dart';
import 'package:flutter/material.dart';

class RegisterTechnicianViewBody extends StatefulWidget {
  const RegisterTechnicianViewBody({super.key});

  @override
  State<RegisterTechnicianViewBody> createState() => _RegisterTechnicianViewBodyState();
}

class _RegisterTechnicianViewBodyState extends State<RegisterTechnicianViewBody> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Text('Register As a Technician',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: ColorManager.blackColor,
                      fontWeight: FontWeight.bold,
                    )),
            const SizedBox(height: 10),
            CustomRegistrationTextField(hintText: 'Technician Name *'),
            CustomRegistrationTextField(hintText: 'ID Number *'),
            const SizedBox(height: 5),
            RegisterPhoneField(hintText: 'Mobile Number ', controller: controller),
            const SizedBox(height: 10),
            CityDropDownField(selectedOption: 'Riyad', options: const ['Riyad', 'Jedda']),
            CustomRegistrationTextField(hintText: 'Profession *'),
            const SizedBox(height: 6),
            UploadImageField(label: 'Identity Image'),
            const SizedBox(height: 10),
            UploadImageField(label: 'Personal Image'),
            const SizedBox(height: 10),
            const TermsConditionsCheck(),
            const SizedBox(height: 60),
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
