import 'package:flutter/material.dart';

const Color MAIN_COLOR = Color(0xFF2FB6C9);
const Color SECOND_COLOR = Color(0xFF98EECC);
const Color THIRD_COLOR = Color(0xFFB2EB97);
const Color FORTH_COLOR = Color(0xFFFBFFDC);
const TEXT_COLOR = Colors.white;

const MaterialColor primary = MaterialColor(_primaryPrimaryValue, <int, Color>{
  50: Color(0xFFEFFBFD),
  100: Color(0xFFD7F6FA),
  200: Color(0xFFBCF0F7),
  300: Color(0xFFA1E9F3),
  400: Color(0xFF8DE5F1),
  500: Color(_primaryPrimaryValue),
  600: Color(0xFF71DCEC),
  700: Color(0xFF66D8E9),
  800: Color(0xFF5CD3E7),
  900: Color(0xFF49CBE2),
});
const int _primaryPrimaryValue = 0xFF79E0EE;

const MaterialColor primaryAccent =
    MaterialColor(_primaryAccentValue, <int, Color>{
  100: Color(0xFFFFFFFF),
  200: Color(_primaryAccentValue),
  400: Color(0xFFD4F8FF),
  700: Color(0xFFBAF4FF),
});
const int _primaryAccentValue = 0xFFFFFFFF;
const MaterialColor font = MaterialColor(_fontPrimaryValue, <int, Color>{
  50: Color(0xFFFFFFFB),
  100: Color(0xFFFEFFF5),
  200: Color(0xFFFDFFEE),
  300: Color(0xFFFCFFE7),
  400: Color(0xFFFCFFE1),
  500: Color(_fontPrimaryValue),
  600: Color(0xFFFAFFD8),
  700: Color(0xFFFAFFD3),
  800: Color(0xFFF9FFCE),
  900: Color(0xFFF8FFC5),
});
const int _fontPrimaryValue = 0xFFFBFFDC;
