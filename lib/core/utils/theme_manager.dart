import 'package:bacura_app/core/utils/index.dart';

ThemeData getAppTheme() {
  return ThemeData(
    cardColor: ColorManager.cardColor,
    //---------------------------------------------------- main Colors
    primaryColor: ColorManager.primaryBlueColor,
    canvasColor: ColorManager.primaryBlueColor,
    scaffoldBackgroundColor: ColorManager.whiteColor,
    //Bottom Navigation Bar theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorManager.primaryBlueColor,
      showUnselectedLabels: false,
      elevation: 0,
      showSelectedLabels: true,
      selectedIconTheme: IconThemeData(
        color: ColorManager.whiteColor,
      ),
      // Set the background color globally
      selectedItemColor: ColorManager.whiteColor,
      // Selected item color
      unselectedItemColor: ColorManager.whiteColor, // Unselected item color
    ),
    //---------------------------------------------------AppBar Theme
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: ColorManager.whiteColor, size: AppSizes.ph30),
      color: ColorManager.primaryBlueColor,
      elevation: AppSizes.e4,
      centerTitle: true,
      toolbarHeight: AppSizes.ph65,
      shadowColor: ColorManager.lightBlueColor,
      titleTextStyle: getMediumStyle(
        fontSize: AppSizes.sp20,
        color: ColorManager.whiteColor,
      ),
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
        alignment: Alignment.center,
        minimumSize: Size(AppSizes.pw170, AppSizes.ph50),
        padding: EdgeInsets.symmetric(vertical: AppSizes.ph10, horizontal: AppSizes.pw25),
        textStyle: getMediumStyle(fontSize: AppSizes.sp24, color: ColorManager.whiteColor),
        backgroundColor: ColorManager.primaryBlueColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.br8)),
      ),
    ),

    /// ----------------------------------------------------------TextTheme
    textTheme: TextTheme(
      titleMedium: getMediumStyle(fontSize: AppSizes.sp20, color: ColorManager.whiteColor),
      titleSmall: getMediumStyle(fontSize: AppSizes.sp14, color: ColorManager.primaryBlueColor),
      displayLarge: getMediumStyle(fontSize: AppSizes.sp32, color: ColorManager.primaryBlueColor),
      displayMedium: getMediumStyle(fontSize: AppSizes.sp18, color: ColorManager.blackColor),
      headlineLarge: getBoldStyle(fontSize: AppSizes.sp36, color: ColorManager.primaryBlueColor),
      bodyMedium: getMediumStyle(fontSize: AppSizes.sp16, color: ColorManager.primaryBlueColor),
      bodyLarge: getMediumStyle(fontSize: AppSizes.sp24, color: ColorManager.primaryBlueColor),
    ),

    //input decoration theme (Text Form Field)
    inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(vertical: AppSizes.ph8, horizontal: AppSizes.pw16),
        hintStyle: getRegularStyle(fontSize: AppSizes.sp20, color: ColorManager.greyColor),
        labelStyle: getRegularStyle(fontSize: AppSizes.sp20, color: ColorManager.greyColor),
        errorStyle: getRegularStyle(fontSize: AppSizes.sp20, color: ColorManager.redColor),
        // ------------------enabledBorder--------------------------------------------------
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.darkBlueColor, width: AppSizes.ph1),
            borderRadius: BorderRadius.circular(AppSizes.br8)),
        //----------------------------------------------focused Border-
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.primaryBlueColor, width: AppSizes.ph1),
            borderRadius: BorderRadius.circular(AppSizes.br8)),
        //----------------------------------------------ErrorBorder
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.redColor, width: AppSizes.ph1),
            borderRadius: BorderRadius.circular(AppSizes.br8))),

    //CardView Theme

    //floating action button Theme
  );
}
