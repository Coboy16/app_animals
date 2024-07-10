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

//btn_continuar
TextStyle btnWelcomeFontAppDog(bool isDarkMode) {
  return GoogleFonts.workSans(
    fontSize: 19,
    color: isDarkMode ? Colors.black : Colors.white,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
  );
}

//Fuente de AppBarHome
TextStyle iconFontNaviagtionON() {
  return GoogleFonts.workSans(
    fontSize: 15,
    color: const Color(0xffff3063),
    fontWeight: FontWeight.w600,
    letterSpacing: -0.5,
  );
}

TextStyle iconFontNaviagtionOFF() {
  return GoogleFonts.workSans(
    fontSize: 14,
    color: const Color(0xffafc5c4),
    fontWeight: FontWeight.w600,
    letterSpacing: -0.5,
  );
}

//view_home
TextStyle titleCategoryHomeView(bool isDarkMode) {
  return GoogleFonts.poppins(
    color: isDarkMode ? Colors.white : Colors.black,
    fontSize: 22,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
  );
}

//title Name Appbar
TextStyle appBarTitleName(bool isDarkMode) {
  return GoogleFonts.quicksand(
    fontSize: 18,
    color: isDarkMode ? Colors.white60 : const Color.fromARGB(255, 36, 40, 44),
    fontWeight: FontWeight.w500,
    letterSpacing: -0.5,
  );
}

//Navigation_home_category
TextStyle nameCategoryHomeView(bool isDarkMode) {
  return GoogleFonts.workSans(
    fontSize: 15,
    color: isDarkMode ? Colors.white : const Color(0xff45515f),
    fontWeight: FontWeight.w400,
    letterSpacing: -0.7,
  );
}

TextStyle nameCategoryHomeView2(bool isDarkMode) {
  return GoogleFonts.workSans(
    fontSize: 15,
    color: isDarkMode ? const Color(0xff45515f) : Colors.white,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.7,
  );
}

//dog view
TextStyle nameAnimalContainerWidget() {
  return GoogleFonts.quicksand(
    fontSize: 17.5,
    color: Colors.white,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.2,
  );
}

//widget container animal
TextStyle razaAnimalContainerWidget() {
  return GoogleFonts.workSans(
    fontSize: 14.5,
    color: Colors.white,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.5,
  );
}

//Detail Pets

//Favortie pets
TextStyle titleNamePetsDetailPets(bool isDarkMode) {
  return GoogleFonts.poppins(
    color: isDarkMode ? Colors.white : Colors.black.withOpacity(0.7),
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
  );
}

TextStyle titlerazaDetailPets(bool isDarkMode) {
  return GoogleFonts.workSans(
    fontSize: 17,
    color: isDarkMode ? Colors.white70 : Colors.grey,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.5,
  );
}

TextStyle titleSexoDetailPets(bool isDarkMode) {
  return GoogleFonts.workSans(
    fontSize: 17,
    color: isDarkMode ? Colors.white70 : Colors.grey,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.5,
  );
}

TextStyle titleGeneroDetailPets(bool isDarkMode) {
  return GoogleFonts.poppins(
    color: isDarkMode ? Colors.white : Colors.black.withOpacity(0.7),
    fontSize: 19,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.6,
  );
}

TextStyle titleVacunaDetailPets(bool vacunado) {
  return GoogleFonts.workSans(
    fontSize: 17,
    color: vacunado ? Colors.black54 : Colors.white,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
  );
}

TextStyle titleLocationDetailPets(bool isDarkMode) {
  return GoogleFonts.workSans(
    fontSize: 18,
    color: isDarkMode ? Colors.white : Colors.grey.shade700,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.5,
  );
}

TextStyle titleSobrePetsDetailPets(bool isDarkMode) {
  return GoogleFonts.poppins(
    color: isDarkMode ? Colors.white : Colors.black.withOpacity(0.7),
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
  );
}

TextStyle subTitleSobreDetailPets(bool isDarkMode) {
  return GoogleFonts.workSans(
    fontSize: 16,
    color: isDarkMode ? Colors.white70 : Colors.grey.shade600,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.5,
  );
}

TextStyle titleBtnAdoptDetailPets() {
  return GoogleFonts.poppins(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
  );
}

TextStyle searchMascota(bool isDarkMode) {
  return GoogleFonts.quicksand(
    fontSize: 16,
    color: isDarkMode ? Colors.white60 : const Color.fromARGB(255, 36, 40, 44),
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
  );
}

TextStyle tagAnimalFavorite() {
  return GoogleFonts.workSans(
    fontSize: 14,
    color: Colors.white,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.5,
  );
}

TextStyle titlePetsFavorite() {
  return GoogleFonts.poppins(
    color: Colors.black,
    fontSize: 21,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
  );
}

TextStyle razaAnimalFavorite() {
  return GoogleFonts.workSans(
    fontSize: 16,
    color: Colors.grey,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.5,
  );
}
