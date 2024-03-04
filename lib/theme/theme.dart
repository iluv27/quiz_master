import 'package:flutter/material.dart';

abstract class AppColors {
  static const bgLight = Color(0xfff6f6f6);
  static const bgDark = Color(0XFF191919);
  static const primary = Color(0xFFE0781E);
  static const secondary = Color(0xFFE2FF06);
}

// LIGHT THEME
ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
      background: AppColors.bgLight,
      primary: AppColors.primary,
      scrim: Color.fromARGB(57, 197, 172, 172)),

  // App Bar Theme
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0.5,
    toolbarHeight: 60,
  ),

  // Text Theme
  textTheme: const TextTheme(
    titleSmall: TextStyle(
        fontSize: 12,
        color: Color.fromARGB(255, 117, 117, 117),
        fontWeight: FontWeight.w300),
    titleMedium: TextStyle(
        fontSize: 16,
        color: Color.fromARGB(255, 25, 25, 25),
        fontWeight: FontWeight.w600),
    bodySmall: TextStyle(color: Color.fromARGB(144, 0, 0, 0), fontSize: 12),
    bodyMedium: TextStyle(color: Color(0xff636363), fontSize: 16),
    bodyLarge: TextStyle(
        color: Color(0xff111111), fontSize: 16, fontWeight: FontWeight.w400),
    displayLarge: TextStyle(
      color: Color(0xff111111),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
        color: Color(0xff111111), fontSize: 16, fontWeight: FontWeight.w500),
    displaySmall: TextStyle(color: Color(0xff666666), fontSize: 14),
  ),
  iconButtonTheme: const IconButtonThemeData(
    style: ButtonStyle(
      iconColor: MaterialStatePropertyAll(
        Color.fromARGB(255, 0, 0, 0),
      ),
    ),
  ),
  iconTheme: const IconThemeData(
    size: 16,
    color: Color(0xff111111),
  ),
  primaryIconTheme: const IconThemeData(color: Color.fromARGB(182, 51, 51, 51)),
  unselectedWidgetColor: const Color.fromARGB(138, 51, 51, 51),
  primaryColorLight: const Color.fromARGB(57, 197, 172, 172),

  // Card Theme
  cardTheme: CardTheme(
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    surfaceTintColor: const Color.fromARGB(255, 0, 0, 0),
    shadowColor: const Color.fromARGB(255, 0, 0, 0),
  ),

  listTileTheme: const ListTileThemeData(tileColor: Colors.white),

  // Search Bar Theme
  searchBarTheme: const SearchBarThemeData(
    backgroundColor: MaterialStatePropertyAll(Colors.white),
    hintStyle: MaterialStatePropertyAll(
      TextStyle(
          color: Color.fromARGB(124, 51, 51, 51),
          fontSize: 16,
          fontWeight: FontWeight.normal),
    ),
    textStyle: MaterialStatePropertyAll(
      TextStyle(
          color: Color(0xff111111),
          fontSize: 16,
          fontWeight: FontWeight.normal),
    ),
    elevation: MaterialStatePropertyAll(0.6),
    surfaceTintColor: MaterialStatePropertyAll(
      Color.fromARGB(192, 17, 17, 17),
    ),
  ),
);

// THIS IS THE DARK THEME
// DARK THEME
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    background: AppColors.bgDark,
    scrim: Color.fromRGBO(0, 0, 0, 1),
  ),

  // App Bar Theme
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xff111111),
    elevation: 0.5,
    toolbarHeight: 60,
  ),

  iconTheme: const IconThemeData(
    size: 16,
    color: Color.fromARGB(255, 212, 212, 212),
  ),

  // Text Theme
  textTheme: const TextTheme(
      titleSmall: TextStyle(
          fontSize: 12,
          color: Color.fromARGB(255, 117, 117, 117),
          fontWeight: FontWeight.w300),
      titleMedium: TextStyle(
          fontSize: 16,
          color: Color.fromARGB(255, 228, 228, 228),
          fontWeight: FontWeight.w600),
      bodySmall:
          TextStyle(color: Color.fromARGB(144, 208, 208, 208), fontSize: 12),
      bodyMedium: TextStyle(color: Color(0xff111111), fontSize: 16),
      bodyLarge: TextStyle(
          color: Color.fromARGB(255, 223, 223, 223),
          fontSize: 16,
          fontWeight: FontWeight.w400),
      displayLarge: TextStyle(
        color: Color.fromARGB(255, 228, 228, 228),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
          color: Color(0xffffffff), fontSize: 16, fontWeight: FontWeight.w500),
      displaySmall: TextStyle(color: Color(0xFF999999), fontSize: 14)),

  listTileTheme: const ListTileThemeData(tileColor: Color(0xff111111)),

  // Card Theme
  cardTheme: CardTheme(
    color: const Color(0xff111111),
    shape: RoundedRectangleBorder(
      side: const BorderSide(
          color: Color.fromARGB(44, 251, 251, 251),
          width: 1,
          strokeAlign: BorderSide.strokeAlignOutside),
      borderRadius: BorderRadius.circular(10),
    ),
    surfaceTintColor: const Color.fromARGB(41, 190, 190, 190),
    shadowColor: const Color.fromARGB(41, 190, 190, 190),
  ),

  // Search Bar Theme
  searchBarTheme: const SearchBarThemeData(
      backgroundColor: MaterialStatePropertyAll(Color(0xff111111)),
      hintStyle: MaterialStatePropertyAll(
        TextStyle(
            color: Color.fromARGB(207, 251, 251, 251),
            fontSize: 16,
            fontWeight: FontWeight.normal),
      ),
      textStyle: MaterialStatePropertyAll(
        TextStyle(
            color: Color(0xffffffff),
            fontSize: 16,
            fontWeight: FontWeight.normal),
      ),
      side: MaterialStatePropertyAll(
        BorderSide(width: 1, color: Color.fromARGB(89, 251, 251, 251)),
      )),
);
