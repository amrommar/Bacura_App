import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:bacura_app/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCard_BottomSheet extends StatefulWidget {
  @override
  State<AddCard_BottomSheet> createState() => _AddCard_BottomSheetState();
}

class _AddCard_BottomSheetState extends State<AddCard_BottomSheet> {
  TextEditingController cardNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.h,
      decoration: BoxDecoration(
          color: ColorManager.whiteColor,
          borderRadius: BorderRadius.circular(AppSize.s20)),
      padding: EdgeInsets.all(AppPadding.p16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /// Enter Card Number TextField ////////////////////////////////////////
            CardCustom_TxtField(
                hintText: 'Enter Card Number',
                controller: cardNumberController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please Enter Card Number';
                  }
                  return null;
                }),

            /// Enter Expire date & CVV TextField ////////////////////////////////////////
            Row(
              children: [
                Expanded(
                  child: CardCustom_TxtField(
                      hintText: 'CVV',
                      controller: cardNumberController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please Enter CVV';
                        }
                        return null;
                      }),
                ),
                Expanded(
                  child: CardCustom_TxtField(
                      hintText: 'MM/YY',
                      controller: cardNumberController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please Enter MM/YY';
                        }
                        return null;
                      }),
                ),
              ],
            ),

            /// Enter Name TextField ////////////////////////////////////////
            CardCustom_TxtField(
                hintText: 'Enter Name',
                controller: cardNumberController,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please Enter Name';
                  }
                  return null;
                }),
            SizedBox(height: 30.h),

            /// Add To Cart Elevated Button//////////////////////////////////////////
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      maximumSize: Size(200.w, 50.h),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSize.s30))),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add Credit',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: ColorManager.whiteColor,
                                fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.add_card, color: ColorManager.whiteColor)
                    ],
                  )),
            ),

            /// navigate PoP Button ///////////////////////////////////////
          ],
        ),
      ),
    );
  }
}

class CardCustom_TxtField extends StatelessWidget {
  String hintText;
  bool isObsucre;
  var keyboardType;
  String? Function(String?)? validator;
  TextEditingController controller;

  CardCustom_TxtField({
    required this.hintText,
    this.isObsucre = false,
    this.validator,
    required this.controller,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, right: 8, left: 8),
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        obscureText: isObsucre,
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorManager.soLightGreyColor,
          // Background color of the TextFormField
          hintText: hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: ColorManager.greyColor),
          contentPadding: EdgeInsets.symmetric(
              vertical: AppPadding.p4, horizontal: AppPadding.p12),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0), // Rounded corners
              borderSide: BorderSide(color: Colors.white) // Border color
              ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: ColorManager.whiteColor)),
          // Border color when not focused
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: ColorManager.whiteColor, // Border color when focused
            ),
          ),
        ),
      ),
    );
  }
}