import 'package:flutter/material.dart';

class LightTheme {
  ThemeData theme = ThemeData(
    primaryColor: const Color.fromRGBO(122, 188, 178, 1),
    primaryColorLight: const Color.fromRGBO(200, 239, 232, 1),
    primaryColorDark: const Color.fromRGBO(33, 76, 69, 1),
    backgroundColor: Colors.white,
    focusColor: const Color.fromRGBO(122, 188, 178, 1),
    errorColor: const Color.fromARGB(255, 195, 29, 26),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: const Color.fromRGBO(242, 158, 146, 1),
      tertiary: Colors.grey[400],
    ),
    fontFamily: 'Inter',
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontSize: 30,
          fontFamily: 'FredokaOne',
          color: Color.fromRGBO(122, 188, 178, 1)),
    ),
  );

  ThemeData get themeData => theme;
}
