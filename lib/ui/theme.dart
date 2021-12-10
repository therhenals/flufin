import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color.fromRGBO(237, 33, 70, 1);
const Color secondaryColor = Color.fromRGBO(252, 76, 55, 1);
const Color background = Color.fromRGBO(215, 216, 218, 1);

const Color primaryColorDark = Color.fromRGBO(237, 33, 70, 1);
const Color backgroundDark = Color.fromRGBO(18, 18, 18, 1);
const Color backgroundShapeDark = Color.fromRGBO(244, 245, 248, 1);

class ThemeStyles {
  static ThemeData dark() {
    return ThemeData.dark().copyWith(
      textTheme: GoogleFonts.poppinsTextTheme(
        ThemeData(brightness: Brightness.dark).textTheme,
      ),
      colorScheme: const ColorScheme.dark(
        primary: primaryColorDark,
        secondary: secondaryColor,
        background: backgroundDark,
      ),
      appBarTheme: const AppBarTheme(
        color: backgroundDark,
        centerTitle: true,
        foregroundColor: primaryColorDark,
      ),
      primaryColor: primaryColorDark,
      backgroundColor: backgroundDark,
      scaffoldBackgroundColor: backgroundDark,
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            width: 2,
            color: primaryColorDark,
          ),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: primaryColorDark,
        backgroundColor: backgroundDark,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: backgroundDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ),
      dividerColor: Colors.white,
    );
    /* return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: const Color.fromRGBO(18, 26, 33, 1),
      primaryColor: primaryColorDark,
      primaryColorBrightness: Brightness.light,
      appBarTheme: const AppBarTheme(color: primaryColorDark),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Color.fromRGBO(51, 29, 91, 1),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          primary: Colors.white,
          side: const BorderSide(
            width: 2,
            color: Colors.white,
          ),
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Color.fromRGBO(18, 26, 33, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: Colors.white,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: primaryColorDark,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        backgroundColor: primaryColorDark,
      ),
      dividerColor: Colors.white,
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          color: Colors.white,
        ),
      ),
    ); */
  }

  static ThemeData light() {
    return ThemeData.light().copyWith(
      textTheme: GoogleFonts.poppinsTextTheme(),
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        secondary: secondaryColor,
        background: background,
      ),
      appBarTheme: const AppBarTheme(
        color: background,
        centerTitle: true,
        foregroundColor: primaryColor,
      ),
      primaryColor: primaryColor,
      backgroundColor: background,
      scaffoldBackgroundColor: background,
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            width: 2,
            color: primaryColor,
          ),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: primaryColor,
        backgroundColor: background,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ),
      dividerColor: Colors.black,
    );
    /* return ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.grey[300],
      appBarTheme: const AppBarTheme(color: primaryColor),
      primaryColor: primaryColor,
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: primaryColor),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: primaryColor,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          primary: primaryColor,
          side: const BorderSide(width: 2, color: primaryColor),
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(primary: primaryColor),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: primaryColor,
      ),
      dividerColor: Colors.black,
    ); */
  }
}
