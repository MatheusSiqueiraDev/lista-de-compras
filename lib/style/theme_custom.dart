import 'package:flutter/material.dart';

class ThemeCustom {
  static Color primaryColor = Color.fromARGB(255, 98, 0, 238);

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
      backgroundColor: primaryColor
    ),
    colorScheme:  ColorScheme.dark(
      primary: primaryColor,
      onPrimary: Colors.white,
      secondary: primaryColor,
      background: Color.fromARGB(255, 37, 37, 37)
    ),
    cardTheme: const CardTheme(
      color: Color.fromARGB(255, 37, 37, 37)
    ),
    iconTheme: IconThemeData(
      color: primaryColor,
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        color: Colors.white,
        overflow: TextOverflow.ellipsis,
      ),
      titleLarge: TextStyle(
        color: Colors.white
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: Color.fromARGB(255, 42,42,42),
    )
  );

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
      backgroundColor: primaryColor
    ),
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      onPrimary: const Color.fromARGB(255, 26,26,26),
      secondary: primaryColor,
      background: const Color.fromARGB(255, 255, 255, 255),
    ),
    cardTheme: const CardTheme(
      color: Color.fromARGB(255, 255, 255, 255),
    ),
    iconTheme: IconThemeData(
      color: primaryColor,
    ),
    textTheme: const TextTheme(
      titleSmall: TextStyle(
        color: Color.fromARGB(255, 121, 121, 121),
        overflow: TextOverflow.ellipsis,
      ),
      titleMedium: TextStyle(
        color: Color.fromARGB(255, 53, 53, 53),
        overflow: TextOverflow.ellipsis,
      ),
      titleLarge: TextStyle(
        color: Color.fromARGB(255, 53, 53, 53),
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: Color.fromARGB(255, 223, 223, 223),
    )
  );
}