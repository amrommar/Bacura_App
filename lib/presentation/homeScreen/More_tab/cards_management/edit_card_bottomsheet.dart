import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:bacura_app/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EditCard_BottomSheet extends StatefulWidget {
  @override
  State<EditCard_BottomSheet> createState() => _EditCard_BottomSheetState();
}

class _EditCard_BottomSheetState extends State<EditCard_BottomSheet> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController mmyyController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  // Mask formatter for MM/YY format
  final maskFormatter = MaskTextInputFormatter(mask: '##/##', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    // Get the height of the keyboard to avoid overlapping
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
        padding: EdgeInsets.only(bottom: bottomPadding),
        child: Form(
          key: formKey,
          child: Container(
              decoration:
                  BoxDecoration(color: ColorManager.whiteColor, borderRadius: BorderRadius.circular(AppSize.s20)),
              padding: EdgeInsets.all(AppPadding.p16),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// Enter Card Number TextField
                      CardCustom_TxtField(
                          hintText: AppLocalizations.of(context)!.enter_card_number,
                          controller: cardNumberController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return AppLocalizations.of(context)!.please_enter_card_number;
                            }
                            return null;
                          }),

                      /// Enter Expiry Date & CVV TextField
                      Row(children: [
                        Expanded(
                            child: CardCustom_TxtField(
                                hintText: AppLocalizations.of(context)!.cvv,
                                controller: cvvController,
                                keyboardType: TextInputType.number,
                                inputFormatter: [
                                  LengthLimitingTextInputFormatter(3), // Limit to 3 characters
                                  FilteringTextInputFormatter.digitsOnly, // Only allow digits
                                ],
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return AppLocalizations.of(context)!.please_enter_cvv;
                                  }
                                  return null;
                                })),
                        SizedBox(width: 8.w),
                        // Add space between the fields
                        Expanded(
                            child: CardCustom_TxtField(
                                hintText: AppLocalizations.of(context)!.mm_yy,
                                controller: mmyyController,
                                keyboardType: TextInputType.number,
                                inputFormatter: [maskFormatter],
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return AppLocalizations.of(context)!.please_enter_mm_yy;
                                  }
                                  return null;
                                }))
                      ]),

                      /// Enter Name TextField
                      CardCustom_TxtField(
                          hintText: AppLocalizations.of(context)!.fullName,
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return AppLocalizations.of(context)!.fullName;
                            }
                            return null;
                          }),
                      SizedBox(height: 30.h),

                      /// Add To Cart Elevated Button
                      Center(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  maximumSize: Size(240.w, 50.h),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(AppSize.s30),
                                  )),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  Navigator.pop(context);
                                }
                              },
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                                Text(AppLocalizations.of(context)!.edit_credit,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(color: ColorManager.whiteColor, fontWeight: FontWeight.bold)),
                                Icon(Icons.add_card, color: ColorManager.whiteColor)
                              ])))
                    ]),
              )),
        ));
  }
}

class CardCustom_TxtField extends StatelessWidget {
  String hintText;
  bool isObsucre;
  var keyboardType;
  String? Function(String?)? validator;
  TextEditingController controller;
  List<TextInputFormatter>? inputFormatter;

  CardCustom_TxtField(
      {required this.hintText,
      this.isObsucre = false,
      this.validator,
      required this.controller,
      this.keyboardType = TextInputType.text,
      this.inputFormatter});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 8.0, right: 8, left: 8),
        child: TextFormField(
            controller: controller,
            validator: validator,
            keyboardType: keyboardType,
            obscureText: isObsucre,
            inputFormatters: inputFormatter,
            decoration: InputDecoration(
                filled: true,
                fillColor: ColorManager.soLightGreyColor,
                // Background color of the TextFormField
                hintText: hintText,
                hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.greyColor),
                contentPadding: EdgeInsets.symmetric(vertical: AppPadding.p4, horizontal: AppPadding.p12),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    // Rounded corners
                    borderSide: BorderSide(color: Colors.white) // Border color
                    ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: ColorManager.whiteColor)),
                // Border color when not focused
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: ColorManager.whiteColor, // Border color when focused
                    )))));
  }
}
