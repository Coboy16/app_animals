import 'package:flutter/material.dart';

Color colorBase(bool isDarkMode) => isDarkMode ? Colors.black : Colors.white;
Color colorBottomNavegation(bool isDarkMode) =>
    isDarkMode ? const Color(0xff222222) : Colors.white;
Color colorAppBar(bool isDarkMode) =>
    isDarkMode ? const Color.fromARGB(255, 42, 47, 53) : Colors.white60;

Color colorBell(bool isDarkMode) =>
    isDarkMode ? const Color.fromARGB(255, 42, 47, 53) : Colors.white;

Color colorSelectCategory(bool isDarkMode) =>
    isDarkMode ? const Color.fromARGB(146, 80, 117, 168) : const Color(0xffe1f7f6);
