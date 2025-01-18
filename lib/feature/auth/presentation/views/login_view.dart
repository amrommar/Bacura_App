import 'package:bacura_app/core/utils/index.dart';

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
