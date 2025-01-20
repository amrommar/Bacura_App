import 'package:bacura_app/core/utils/index.dart';

class GetstartedScreen extends StatefulWidget {
  const GetstartedScreen({super.key});

  @override
  State<GetstartedScreen> createState() => _GetstartedScreenState();
}

class _GetstartedScreenState extends State<GetstartedScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LanguageProvider>(context);
    return Stack(children: [
      ////   background Image   ////////////////
      Image.asset(ImageAssets.background2Image),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 29.w, vertical: 70.h),
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
              const RegisterRowWidget(),
            ]))),
      )
    ]);
  }
}
