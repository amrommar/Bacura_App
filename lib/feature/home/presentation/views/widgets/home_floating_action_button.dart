import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/core/utils/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeFloatingActionButton extends StatefulWidget {
  const HomeFloatingActionButton({super.key});

  @override
  State<HomeFloatingActionButton> createState() => _HomeFloatingActionButtonState();
}

class _HomeFloatingActionButtonState extends State<HomeFloatingActionButton> {
  bool isFocused = false;
  bool hasClickedOnce = false; // Tracks whether the FAB has been clicked once

  @override
  Widget build(BuildContext context) {
    // Check the current text direction (LTR or RTL)
    bool isRTL = Directionality.of(context) == TextDirection.rtl;

    return Stack(children: [
      AnimatedPositioned(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        bottom: 5.h,
        // Adjust position based on text direction
        left: isRTL
            ? (isFocused
                ? MediaQuery.of(context).size.width - 100.w // RTL focused
                : MediaQuery.of(context).size.width - 60.w) // RTL default
            : (isFocused
                ? MediaQuery.of(context).size.width - 400.w // LTR focused
                : MediaQuery.of(context).size.width - 430.w),
        // LTR default
        child: AnimatedOpacity(
          opacity: isFocused ? 1.0 : 0.6,
          duration: const Duration(milliseconds: 500),
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                if (!isFocused) {
                  // First click focuses the button
                  isFocused = true;
                  hasClickedOnce = true;
                } else if (hasClickedOnce) {
                  // Second click navigates to the route
                  Navigator.pushNamed(context, Routes.customerServiceRoute);
                }
              });
            },
            backgroundColor: ColorManager.primaryBlueColor,
            child: Icon(
              Icons.headset_mic_outlined,
              color: ColorManager.whiteColor,
              size: 40,
            ),
          ),
        ),
      )
    ]);
  }
}
