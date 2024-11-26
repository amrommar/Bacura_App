import 'package:bacura_app/feature/auth/presetation/views/widgets/bacura_logo_container.dart';
import 'package:bacura_app/feature/getStarted/presentation/views/widgets/change_language_icon.dart';
import 'package:bacura_app/feature/getStarted/presentation/views/widgets/continue_as_visitor_button.dart';
import 'package:bacura_app/feature/getStarted/presentation/views/widgets/login_button.dart';
import 'package:bacura_app/feature/getStarted/presentation/views/widgets/row_to_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStartedViewBody extends StatefulWidget {
  const GetStartedViewBody({super.key});

  @override
  State<GetStartedViewBody> createState() => _GetStartedViewBodyState();
}

class _GetStartedViewBodyState extends State<GetStartedViewBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 29.w, vertical: 70.h),
        child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          //language change icon ________________________________________________
          const ChangeLanguageIcon(),
          SizedBox(height: 40.h),
          //Bacura logo container _________________________________________
          const BacuraLogoContainer(),
          SizedBox(height: 80.h),
          //welcome message ____________________________________
          Text(
            'أهلا بك في تطبيق باكورة',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(height: 10.h),
          Text(
              textAlign: TextAlign.center,
              'يمكنك تصفح التطبيق بدون تسجيل',
              style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(height: 80.h),
          //As A Visitor button______________________________
          const ContinueAsVisitorButton(),
          SizedBox(height: 26.h),
          //Login button______________________________
          const LoginButton(),
          SizedBox(height: 18.h),
          //Register button______________________________
          const RowToRegister(),
        ])));
  }
}
