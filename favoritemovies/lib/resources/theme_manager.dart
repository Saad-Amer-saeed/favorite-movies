import 'package:favoritemovies/resources/color_manager.dart';
import 'package:flutter/material.dart';

import 'values_manger.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors of the app

    primaryColor: ColorManager.lightdark,
    primaryColorLight: ColorManager.lightdark,
    primaryColorDark: ColorManager.lightdark,
    scaffoldBackgroundColor: ColorManager.lightdark,
    // disabledColor: ColorManager
    //     .grey1, // will be used in case of a disabled button for example
    // splashColor: ColorManager.primaryOpacity70,
    // colorScheme: const ColorScheme.light(
    //   primary: ColorManager.primary,
    //   secondary: ColorManager.grey, // Accent color as secondary
    // ),
    // cardTheme: CardTheme(
    //   elevation: 4,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(12),
    //   ),
    // ),
    // appBarTheme: AppBarTheme(
    //     centerTitle: true,
    //     color: ColorManager.primary,
    //     elevation: AppSize.s4,
    //     shadowColor: ColorManager.primaryOpacity70,
    //     titleTextStyle: getRegularStyle(
    //         color: ColorManager.white, fontSize: FontSize.s16)),
    appBarTheme: AppBarTheme(
        centerTitle: true,
        // color: ColorManager.dark,
        backgroundColor: ColorManager.dark,

        // elevation: AppSize.s4,
        // shadowColor: ColorManager.primaryOpacity70,
        // titleTextStyle: getRegularStyle(
        //     color: ColorManager.white, fontSize: FontSize.s16)
        titleTextStyle: TextStyle(
          color: Colors.white, // Title color
          fontSize: 20, // Title font size
          fontWeight: FontWeight.bold, // Font weight
          fontFamily:
              'Roboto', // Custom font family (ensure it is included in pubspec.yaml)
        )),

    // buttonTheme: const ButtonThemeData(
    //     shape: StadiumBorder(),
    //     disabledColor: ColorManager.grey1,
    //     buttonColor: ColorManager.primary,
    //     splashColor: ColorManager.primaryOpacity70),
    // // elevated button theme
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //     style: ElevatedButton.styleFrom(
    //         textStyle: getRegularStyle(color: ColorManager.white),
    //         backgroundColor: ColorManager.primary,
    //         shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(AppSize.s12)))),
    // textTheme: TextTheme(
    //   headlineLarge: getSemiBoldStyle(
    //       color: ColorManager.darkGrey,
    //       fontSize: FontSize.s16), // Replaces headline1
    //   bodyLarge: getMediumStyle(
    //       color: ColorManager.lightGrey,
    //       fontSize: FontSize.s14), // Replaces subtitle1
    //   labelSmall:
    //       getRegularStyle(color: ColorManager.grey1), // Replaces caption
    //   bodyMedium:
    //       getRegularStyle(color: ColorManager.grey), // Replaces bodyText1
    // ),
    // inputDecorationTheme: InputDecorationTheme(
    //   contentPadding: const EdgeInsets.all(AppPadding.p8),
    //   // hint style
    //   hintStyle: getRegularStyle(color: ColorManager.grey1),
    //   // label style
    //   labelStyle: getMediumStyle(color: ColorManager.darkGrey),
    //   // error style
    //   errorStyle: getRegularStyle(color: ColorManager.error),
    //   // enabled border
    //   enabledBorder: const OutlineInputBorder(
    //       borderSide:
    //           BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
    //       borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
    //   // focused border
    //   focusedBorder: const OutlineInputBorder(
    //       borderSide:
    //           BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
    //       borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
    //   // error border
    //   errorBorder: const OutlineInputBorder(
    //       borderSide:
    //           BorderSide(color: ColorManager.error, width: AppSize.s1_5),
    //       borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
    //   // focused error border
    //   focusedErrorBorder: const OutlineInputBorder(
    //       borderSide:
    //           BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
    //       borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
    // ));
  );
}
