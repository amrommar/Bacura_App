import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/widgets/small_elevatedbutton.dart';
import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:bacura_app/presentation/resources/routes_manager.dart';
import 'package:bacura_app/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RequestSent_BottomSheet extends StatefulWidget {
  @override
  State<RequestSent_BottomSheet> createState() =>
      _RequestSent_BottomSheetState();
}

class _RequestSent_BottomSheetState extends State<RequestSent_BottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorManager.whiteColor,
          borderRadius: BorderRadius.circular(AppSize.s20)),
      padding: EdgeInsets.all(AppPadding.p16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/images/fani_img.png'),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'We sent the request, The service provider will contact you.',
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: ColorManager.greyColor),
              ),
            ),

            /// Go to Questions Or skip Button//////////////////////////////////////////
            SmallElevatedbutton(
                text: 'Ok',
                onPressed: () {
                  Navigator.pushNamed(context, Routes.paymentScreenRoute);
                }),
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
