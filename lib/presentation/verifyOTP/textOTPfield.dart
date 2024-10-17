import 'package:bacura_app/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OTP_TextField extends StatefulWidget {
  @override
  State<OTP_TextField> createState() => _OTP_TextFieldState();
}

class _OTP_TextFieldState extends State<OTP_TextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.symmetric(horizontal: AppMargin.m8),
      height: 60.h,
      width: 60.w,
      child: TextFormField(
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,

        style: Theme.of(context).textTheme.displayLarge,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 20.h),
        ),
        // decoration: InputDecoration(contentPadding: EdgeInsets.all(20)),
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
