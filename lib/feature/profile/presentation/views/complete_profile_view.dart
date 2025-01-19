import 'package:bacura_app/core/utils/assets_manager.dart';
import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/feature/profile/presentation/views/components/register_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompleteProfileView extends StatefulWidget {
  const CompleteProfileView({super.key});

  @override
  State<CompleteProfileView> createState() => _CompleteProfileViewState();
}

class _CompleteProfileViewState extends State<CompleteProfileView> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(ImageAssets.background2Image),
      Scaffold(
          appBar: AppBar(
              iconTheme: IconThemeData(
                color: ColorManager.primaryBlueColor,
                size: 30.h,
              ),
              backgroundColor: ColorManager.transparent,
              elevation: 0,
              centerTitle: true,
              toolbarHeight: 40.h),
          backgroundColor: ColorManager.transparent,
          body: const RegisterViewBody())
    ]);
  }
}
