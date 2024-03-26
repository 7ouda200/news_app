import 'package:flutter/material.dart';

class AppTheme {
  static Color primaryLight = const Color(0xFF39A552);
  static Color primaryDark=Color(0xFF141A2E);
  static Color navycolor = const Color(0xFF4F5A69);
  static Color backgroundColorLight = Color(0xFFDFECDB);
  static Color backgroundColorDark = Color(0xFF060E1E);
  static Color greenColor = Color(0xFF61E757);
  static Color redColor = Color(0xFFEC4B4B);
  static Color blackColor = Color(0xFF141922);
  static Color greyColor = Color(0xFFC8C9CB);
  static Color whiteColor = Color(0xFFFFFFFF);
  static Color taskcolor = Color(0xFF141922);



  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryLight,
    scaffoldBackgroundColor:whiteColor,
    appBarTheme: AppBarTheme(
      foregroundColor: whiteColor,
      shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35), bottomRight: Radius.circular(30))),
      backgroundColor: primaryLight,
      centerTitle: true,
      titleTextStyle:const TextStyle(
          color:Colors.white, fontSize: 22.0, fontWeight: FontWeight.w400),
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w400,
          color: whiteColor
      ),
      titleMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: blackColor
      ),
      bodyLarge: TextStyle(
        fontSize:24,
        fontWeight: FontWeight.bold,
        color:whiteColor,
      ),
      bodySmall: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: navycolor
      ),
      headlineSmall: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: blackColor,
      ),
      titleLarge: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w400, color: blackColor),
      titleSmall: TextStyle(
        color: blackColor,
        fontSize: 20,
       // fontWeight: FontWeight.bold
      )
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryDark,
    scaffoldBackgroundColor: primaryDark,
    appBarTheme: AppBarTheme(
      shape: RoundedRectangleBorder(
        borderRadius:BorderRadius.circular(28)
      ),
      backgroundColor: primaryLight,
      titleTextStyle:const TextStyle(
          color:Colors.white, fontSize: 22.0, fontWeight: FontWeight.w400),
    ),

    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize:20,
        fontWeight: FontWeight.w400,
        color: whiteColor,
      ),
      bodySmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: whiteColor
      ),
      headlineSmall: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: whiteColor,
      ),
      titleLarge: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w400, color: whiteColor),
    ),


  );
}
