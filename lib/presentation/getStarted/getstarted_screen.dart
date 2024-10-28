import 'package:bacura_app/presentation/resources/assets_manager.dart';
import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:bacura_app/presentation/resources/routes_manager.dart';
import 'package:bacura_app/providers/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Getstarted_Screen extends StatefulWidget {
  const Getstarted_Screen({super.key});

  @override
  State<Getstarted_Screen> createState() => _Getstarted_ScreenState();
}

class _Getstarted_ScreenState extends State<Getstarted_Screen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(children: [
      Image.asset(ImageAssets.background2Image),
      Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
              padding: EdgeInsets.symmetric(horizontal: 29.w, vertical: 65.h),
              child: SingleChildScrollView(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                //language change icon ________________________________________________
                Align(
                    child: InkWell(
                      onTap: () {
                        provider.changeLanguage();
                      },
                      child: Text(AppLocalizations.of(context)!.ar_en,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.bold, color: ColorManager.primaryBlueColor)),
                    ),
                    alignment: Alignment.topRight),
                SizedBox(height: 20.h),
                //Bacura logo container _________________________________________
                Container(width: 280.h, child: SvgPicture.asset(ImageAssets.bacuraLogo)),
                SizedBox(height: 95.h),
                //welcome message ____________________________________
                Text('Welcome to Bacura App', style: Theme.of(context).textTheme.displayLarge),
                SizedBox(height: 10.h),
                Container(
                    width: 300.w,
                    child: Text(
                        textAlign: TextAlign.center,
                        'you Can Browse The Application Without Registering',
                        style: Theme.of(context).textTheme.bodyMedium)),
                SizedBox(height: 100.h),
                //As A Visitor button______________________________
                ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: ColorManager.lightBlueColor),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, Routes.homeScreenRoute, (Route<dynamic> route) => false);
                    },
                    child: Text(AppLocalizations.of(context)!.continue_as_a_visitor,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.primaryBlueColor))),
                SizedBox(height: 26.h),
                //Login button______________________________
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.loginRoute);
                    },
                    child: Text(AppLocalizations.of(context)!.login, style: Theme.of(context).textTheme.titleMedium)),
                SizedBox(height: 18.h),
                //Register button______________________________
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(AppLocalizations.of(context)!.dont_have_an_account,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorManager.blackColor)),
                  SizedBox(width: 5.w),
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.registerRoute);
                      },
                      child: Text(AppLocalizations.of(context)!.create_an_account,
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold)))
                ])
              ]))))
    ]);
  }
}
