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

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      AnimatedPositioned(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          bottom: 10.h,
          left: isFocused ? MediaQuery.of(context).size.width - 100.w : 340.w,
          child: AnimatedOpacity(
              opacity: isFocused ? 1.0 : 0.5,
              duration: const Duration(milliseconds: 500),
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
                  backgroundColor: ColorManager.primaryBlueColor,
                  child: Icon(
                    Icons.headset_mic_outlined,
                    color: ColorManager.whiteColor,
                    size: 40,
                  ))))
    ]);
  }
}
