import 'package:flutter/material.dart';

Color colorBase(bool isDarkMode) => isDarkMode ? Colors.black : Colors.white;
Color colorAppBar(bool isDarkMode) =>
    isDarkMode ? const Color(0xff222222) : Colors.white;
