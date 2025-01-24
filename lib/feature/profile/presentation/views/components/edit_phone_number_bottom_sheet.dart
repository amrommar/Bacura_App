import 'package:bacura_app/core/presentation/widget/custom_elevated_button.dart';
import 'package:bacura_app/core/presentation/widget/custom_text_form_field.dart';
import 'package:bacura_app/core/utils/app_sizes.dart';
import 'package:bacura_app/core/utils/font_manager.dart';
import 'package:bacura_app/feature/profile/presentation/controller/my_profile_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class EditPhoneNumberBottomSheet extends StatefulWidget {
  const EditPhoneNumberBottomSheet({super.key});

  @override
  State<EditPhoneNumberBottomSheet> createState() => _EditPhoneNumberBottomSheetState();
}

class _EditPhoneNumberBottomSheetState extends State<EditPhoneNumberBottomSheet> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProfileProvider>(
      builder: (context, provider, child) {
        if (provider.textFieldHeight == null) provider.getTextFieldHeight();

        return Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: AppSizes.ph12),
                        Text(
                          'change phone number',
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                fontSize: AppSizes.sp16,
                                fontWeight: FontWeightManager.medium,
                              ),
                        ),
                        SizedBox(height: AppSizes.ph6),
                        Text(
                          'enter your new phone number',
                          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                                fontSize: AppSizes.sp14,
                              ),
                        ),
                        SizedBox(height: AppSizes.ph24),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: CustomTextFormField(
                                key: provider.countryPickerWidgetKey,
                                controller: provider.phoneNumController,
                                labelText: 'phone number',
                                keyboardType: TextInputType.phone,
                                maxLength: 9,
                                validator: provider.phoneNumberValidator,
                                onChanged: (value) {
                                  setState(() {});
                                  _formKey.currentState!.validate();
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: AppSizes.ph16),
                    child: CustomElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          // await provider.validatePhoneNumber(widget.countriesEntity);
                        }
                      },
                      isLoading: provider.isLoading,
                      text: 'verify',
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
