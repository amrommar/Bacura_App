import 'package:bacura_app/presentation/resources/styles_manager.dart';
import 'package:bacura_app/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'font_manager.dart';

ThemeData getAppTheme() {
  return ThemeData(
    //---------------------------------------------------- main Colors
    primaryColor: ColorManager.primaryBlueColor,
    //---------------------------------------------------AppBar Theme
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: ColorManager.whiteColor),
      color: ColorManager.primaryBlueColor,
      elevation: AppSize.s4,
      centerTitle: true,
      shadowColor: ColorManager.lightBlueColor,
      titleTextStyle:
          getBoldStyle(fontSize: 24, color: ColorManager.whiteColor),
    ),
    // ------------------------------------------------- Button Theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.greyColor,
      buttonColor: ColorManager.primaryBlueColor,
      splashColor: ColorManager.lightBlueColor,
    ),

    //-----------------------------------------------Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
            vertical: AppPadding.p10, horizontal: AppPadding.p25),
        textStyle: getMediumStyle(fontSize: 24, color: ColorManager.whiteColor),
        backgroundColor: ColorManager.primaryBlueColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s8)),
      ),
    ),

    /// ----------------------------------------------------------TextTheme

    textTheme: TextTheme(
      titleMedium: getMediumStyle(
          fontSize: FontSize.s20, color: ColorManager.whiteColor),
      displayMedium: getMediumStyle(
          fontSize: FontSize.s18, color: ColorManager.blackColor),
      headlineLarge: getBoldStyle(
          fontSize: FontSize.s36, color: ColorManager.primaryBlueColor),
      displayLarge: getMediumStyle(
          fontSize: FontSize.s32, color: ColorManager.primaryBlueColor),
      bodyMedium: getMediumStyle(
          fontSize: FontSize.s16, color: ColorManager.primaryBlueColor),
      titleSmall: getMediumStyle(
          fontSize: FontSize.s14, color: ColorManager.primaryBlueColor),
    ),

    //input decoration theme (Text Form Field)
    inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(
            vertical: AppPadding.p8, horizontal: AppPadding.p16),
        hintStyle: getRegularStyle(
            fontSize: AppSize.s20, color: ColorManager.greyColor),
        labelStyle: getRegularStyle(
            fontSize: AppSize.s20, color: ColorManager.greyColor),
        errorStyle: getRegularStyle(
            fontSize: AppSize.s20, color: ColorManager.redColor),
        // ------------------enabledBorder--------------------------------------------------
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ColorManager.darkBlueColor, width: AppSize.s2),
            borderRadius: BorderRadius.circular(AppSize.s8)),
        //----------------------------------------------focused Border-
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ColorManager.primaryBlueColor, width: AppSize.s1),
            borderRadius: BorderRadius.circular(AppSize.s8)),
        //----------------------------------------------ErrorBorder
        errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.redColor, width: AppSize.s1),
            borderRadius: BorderRadius.circular(AppSize.s8))),

    //CardView Theme

    //Bottom Navigation Bar theme
    //floating action button Theme
  );
}
