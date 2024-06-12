import 'package:flutter/material.dart';

class Themes {
  static final dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: Colors.black,
    indicatorColor: Colors.white,
    useMaterial3: true,
    // colorScheme: ColorScheme.dark(),
    // iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8),
  );

  static final light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.white,
    indicatorColor: Colors.black,
    useMaterial3: true,

    // iconTheme: const IconThemeData(color: Colors.red, opacity: 0.8),
  );
}
