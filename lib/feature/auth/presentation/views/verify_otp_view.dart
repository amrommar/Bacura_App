import 'package:bacura_app/core/utils/index.dart';

class VerifyOTPView extends StatefulWidget {
  const VerifyOTPView({super.key});

  @override
  State<VerifyOTPView> createState() => _VerifyOTPViewState();
}

class _VerifyOTPViewState extends State<VerifyOTPView> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(ImageAssets.background2Image),
      Scaffold(
          appBar: AppBar(
              iconTheme: IconThemeData(color: ColorManager.primaryBlueColor, size: 30),
              backgroundColor: ColorManager.transparent,
              elevation: 0,
              toolbarHeight: 100.h),
          backgroundColor: ColorManager.transparent,
          resizeToAvoidBottomInset: false,
          body: const VerifyView())
    ]);
  }

// Validation function for the PIN
}
