import 'package:bacura_app/core/utils/assets_manager.dart';
import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/feature/auth/presentation/controller/login_provider.dart';
import 'package:bacura_app/feature/auth/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(ImageAssets.background2Image),
      ChangeNotifierProvider(
        create: (context) => LoginProvider(),
        child: Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: ColorManager.primaryBlueColor,
                size: 30.h,
              ),
              backgroundColor: ColorManager.transparent,
              elevation: 0,
              centerTitle: true,
              toolbarHeight: 100.h,
            ),
            backgroundColor: ColorManager.transparent,
            body: const LoginViewBody()),
      )
    ]);
  }
}
