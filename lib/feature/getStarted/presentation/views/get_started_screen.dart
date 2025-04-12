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
      Image.asset(
        AppAssets.background2Image,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.pw25,
              vertical: AppSizes.ph70,
            ),
            child: SingleChildScrollView(
                child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              //language change icon ________________________________________________
              // const ChangeLanguageIconWidget(),
              SizedBox(height: AppSizes.ph80),
              //Bacura logo container _________________________________________
              const BacuraLogoWidget(),

              SizedBox(height: AppSizes.ph60),
              //welcome message ____________________________________
              Text(
                AppStrings.welcomeToBacuraApp,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(height: AppSizes.ph10),
              Text(
                textAlign: TextAlign.center,
                AppStrings.browseAppWithoutRegister,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: AppSizes.ph80),
              //As A Visitor button______________________________
              const ContinueAsVisitorButton(),
              SizedBox(height: AppSizes.ph26),
              //Login button______________________________
              const LoginButton(),
              SizedBox(height: AppSizes.ph18),
              // //Register button______________________________
              // const RegisterRowWidget(),
            ]))),
      )
    ]);
  }
}
