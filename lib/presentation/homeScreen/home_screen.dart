import 'package:bacura_app/presentation/homeScreen/More_tab/more_tab.dart';
import 'package:bacura_app/presentation/homeScreen/Offers_tab/offers_tab.dart';
import 'package:bacura_app/presentation/homeScreen/Requests_tab/requests_tab.dart';
import 'package:bacura_app/presentation/homeScreen/home_tab/home_tab.dart';
import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:bacura_app/presentation/resources/routes_manager.dart';
import 'package:bacura_app/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  int currentIndex = 0;

  List<Widget> Tabs = [Home_Tab(), Requests_Tab(), Offers_Tab(), More_Tab()];
  List<String> appBarTitles = [AppStrings.home, AppStrings.requests, AppStrings.offers, AppStrings.more];

  var formKey = GlobalKey<FormState>();
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      appBar: AppBar(
          titleSpacing: 5,
          centerTitle: false,
          title: Text('Hi, Mohamed',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.whiteColor)),
          elevation: 0,
          leading: InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.personalDetailsRoute);
              },
              child: Row(children: [
                SizedBox(width: 8.w),
                Flexible(
                    child: CircleAvatar(
                        radius: 23.w,
                        backgroundColor: ColorManager.whiteColor,
                        child: Image.asset('assets/images/Ellipse 1.png')))
              ])),
          actions: [
            IconButton(
                icon: Icon(Icons.notifications, size: 30.h),
                onPressed: () {
                  Navigator.pushNamed(context, Routes.notificationsRoute);
                })
          ]),
      floatingActionButton: Stack(children: [
        AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            bottom: 10.h,
            left: isFocused ? MediaQuery.of(context).size.width - 100.w : 340.w,
            // Adjusted from -40 to 0
            child: AnimatedOpacity(
                opacity: isFocused ? 1.0 : 0.5,
                duration: Duration(milliseconds: 500),
                child: FloatingActionButton(
                    onPressed: () {
                      if (!isFocused) {
                        setState(() {
                          isFocused = true;
                        });
                      } else {
                        Navigator.pushNamed(context, Routes.customerServiceRoute);
                      }
                    },
                    child: Icon(Icons.headset_mic_outlined, color: ColorManager.whiteColor, size: 40),
                    backgroundColor: ColorManager.primaryBlueColor)))
      ]),
      bottomNavigationBar: SalomonBottomBar(
        backgroundColor: ColorManager.primaryBlueColor,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          /// home
          SalomonBottomBarItem(
            title: Text(AppLocalizations.of(context)!.home),
            icon: Icon(Icons.home_filled, color: ColorManager.whiteColor),
            selectedColor: ColorManager.whiteColor,
          ),

          /// requests
          SalomonBottomBarItem(
              title: Text(AppLocalizations.of(context)!.requests),
              icon: Icon(Icons.request_page_outlined, color: ColorManager.whiteColor),
              selectedColor: ColorManager.whiteColor),

          /// offers
          SalomonBottomBarItem(
              title: Text(AppLocalizations.of(context)!.offers),
              icon: Icon(Icons.local_offer_outlined, color: ColorManager.whiteColor),
              selectedColor: ColorManager.whiteColor),

          /// More
          SalomonBottomBarItem(
              title: Text(AppLocalizations.of(context)!.more),
              icon: Icon(Icons.more_horiz, color: ColorManager.whiteColor),
              selectedColor: ColorManager.whiteColor),
        ],
      ),
      body: Tabs[currentIndex],
    );
  }
}
