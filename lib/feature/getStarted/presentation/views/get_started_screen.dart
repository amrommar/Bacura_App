import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/getStarted/index.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      //   background Image
      Image.asset(AppAssets.background2Image),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 70.h),
            child: SingleChildScrollView(
                child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              //language change icon ________________________________________________
              const ChangeLanguageIconWidget(),
              SizedBox(height: 40.h),
              //Bacura logo container _________________________________________
              const BacuraLogoWidget(),
              SizedBox(height: 80.h),
              //welcome message ____________________________________
              Text(
                'أهلا بك في تطبيق باكورة',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(height: 10.h),
              Text(textAlign: TextAlign.center, 'يمكنك تصفح التطبيق بدون تسجيل', style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(height: 80.h),
              //As A Visitor button______________________________
              const ContinueAsVisitorButton(),
              SizedBox(height: 26.h),
              //Login button______________________________
              const LoginButton(),
              SizedBox(height: 18.h),
              // //Register button______________________________
              // const RegisterRowWidget(),
            ]))),
      )
    ]);
  }
}
