import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_shift/core/colors.dart';

class Appthemes {
static  ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: white,
      appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: black),
        surfaceTintColor: white,
        titleTextStyle:
            GoogleFonts.diphylleia(fontSize: 24, fontWeight: FontWeight.w400),
        backgroundColor: white,
      ),
      textTheme: TextTheme(
        displayLarge:
            GoogleFonts.diphylleia(fontSize: 35, fontWeight: FontWeight.w500),
        displaySmall: GoogleFonts.roboto(
            color: appThemeColor2, fontSize: 18, fontWeight: FontWeight.w500),
        titleLarge: GoogleFonts.roboto(fontSize: 28),
        titleMedium: GoogleFonts.roboto(fontSize: 22),
        bodyLarge: GoogleFonts.roboto(fontSize: 18),
        bodyMedium:
            GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.bold),
        bodySmall: GoogleFonts.roboto(fontSize: 16),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: white,
      ),
      snackBarTheme: SnackBarThemeData(
        contentTextStyle: GoogleFonts.barlow(
            color: white, fontSize: 20, fontWeight: FontWeight.w500),
      ),
      fontFamily: GoogleFonts.roboto().fontFamily,
      useMaterial3: true,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }

 static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: black,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: black,
      ),
      appBarTheme: AppBarTheme(
        surfaceTintColor: black,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle:
            GoogleFonts.diphylleia(fontSize: 24, fontWeight: FontWeight.w400),
        backgroundColor: black,
      ),
      useMaterial3: true,
      textTheme: TextTheme(
        displayLarge:
            GoogleFonts.diphylleia(fontSize: 35, fontWeight: FontWeight.w500),
        displaySmall: GoogleFonts.roboto(
            color: appThemeColor2, fontSize: 18, fontWeight: FontWeight.w500),
        titleLarge: GoogleFonts.roboto(fontSize: 28),
        titleMedium: GoogleFonts.roboto(fontSize: 22),
        bodyLarge: GoogleFonts.roboto(fontSize: 18),
        bodyMedium:
            GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.bold),
        bodySmall: GoogleFonts.roboto(fontSize: 16),
      ),
      snackBarTheme: SnackBarThemeData(
        contentTextStyle: GoogleFonts.barlow(
            color: white, fontSize: 20, fontWeight: FontWeight.w500),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }
}
