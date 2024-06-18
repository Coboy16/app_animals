import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//welcome_app
TextStyle welcomeFontAppDog(bool isDarkMode) {
  return GoogleFonts.poppins(
    color: isDarkMode ? Colors.white60 : const Color(0xff45515f),
    fontSize: 30,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.25,
  );
}

//body_app
TextStyle bodyFontAppDog(bool isDarkMode) {
  return GoogleFonts.workSans(
    fontSize: 21,
    color: isDarkMode ? Colors.white60 : const Color(0xff45515f),
    fontWeight: FontWeight.w300,
    letterSpacing: -1,
  );
}

TextStyle textAdoptaAppDog(bool isDarkMode) {
  return GoogleFonts.workSans(
    fontSize: 19,
    color: isDarkMode ? Colors.white60 : const Color(0xff45515f),
    fontWeight: FontWeight.w300,
    letterSpacing: -1,
  );
}

// //buttom_welcome
// TextStyle buttomFontAppDog(bool isDarkMode) {
//   return GoogleFonts.workSans(
//     fontSize: 19,
//     color: const Color(0xff45515f),
//     fontWeight: FontWeight.w500,
//     letterSpacing: -1,
//   );
// }

//btn_continuar
TextStyle btnWelcomeFontAppDog(bool isDarkMode) {
  return GoogleFonts.workSans(
    fontSize: 19,
    color: isDarkMode ? Colors.black : Colors.white,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
  );
}
