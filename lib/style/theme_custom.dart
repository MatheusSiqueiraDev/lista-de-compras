import 'package:flutter/material.dart';

class ThemeCustom {
  static Color primaryColor = Colors.deepPurple;

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
      color: Color.fromARGB(255, 42,42,42)
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
    ),
    useMaterial3: true,
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
      color: Color.fromARGB(255, 241, 241, 241),
    ),
    iconTheme: IconThemeData(
      color: primaryColor,
    ),
    textTheme: const TextTheme(
      titleSmall: TextStyle(
        color: Color.fromARGB(255, 65, 65, 65),
        overflow: TextOverflow.ellipsis,
      ),
      titleMedium: TextStyle(
        color: Color.fromARGB(255, 71, 71, 71),
        overflow: TextOverflow.ellipsis,
      ),
      titleLarge: TextStyle(
        color: Color.fromARGB(255, 57, 57, 57),
        overflow: TextOverflow.ellipsis,
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: Color.fromARGB(255, 241, 241, 241),
    ),
    useMaterial3: true,
  );
}