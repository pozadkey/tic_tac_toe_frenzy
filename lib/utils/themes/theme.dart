import 'package:flutter/material.dart';

// Default app theme
ThemeData theme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
  colorScheme: ColorScheme.dark(
      background: Colors.black,
      primary: Colors.grey[900]!,
      secondary: Colors.grey[800]!),

  // Text Theme
  textTheme: const TextTheme(
    // Header text style
    displayLarge: TextStyle(
        fontSize: 96,
        color: Color.fromRGBO(255, 255, 255, 1),
        fontFamily: 'ClashDisplay',
        fontWeight: FontWeight.w500,
        letterSpacing: 0.2),
// Header text style mobile
    headlineMedium: TextStyle(
        fontSize: 58,
        color: Color.fromRGBO(255, 255, 255, 1),
        fontFamily: 'ClashDisplay',
        fontWeight: FontWeight.w500,
        letterSpacing: 0.2),

    // Medium text style
    displayMedium: TextStyle(
        fontSize: 20,
        color: Color.fromARGB(255, 239, 239, 239),
        fontFamily: 'SpaceGrotesk',
        fontWeight: FontWeight.w400,
        height: 1.5,
        letterSpacing: 0.2),

    // default text style
    displaySmall: TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontFamily: 'SpaceGrotesk',
        fontWeight: FontWeight.w400,
        height: 1.5,
        letterSpacing: 0.2),

    titleSmall: TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontFamily: 'SpaceGrotesk',
        fontWeight: FontWeight.w400,
        height: 1.5,
        letterSpacing: 0.2),

    titleMedium: TextStyle(
        fontSize: 32,
        color: Color.fromRGBO(255, 255, 255, 1),
        fontFamily: 'ClashDisplay',
        fontWeight: FontWeight.w500,
        letterSpacing: 0.2),
  ),
);

// Primary Button Colors
class PrimaryButtonColors {
  static Color initialTextColor = Colors.black; // Primary text color
  static Color hoverInTextColor = Colors.black; // Hover In text color
  static Color initialBgColor = Colors.white; // Primary background color
  static Color hoverInBgColor =
      const Color(0xFFD6D6D6); // Hover In background color
  static Color hoverOutTextColor = Colors.black; // Hover Out text color
  static Color hoverOutBgColor = Colors.white; // Hover Out background color
}

// Secondary Button Colors
class SecondaryButtonColors {
  static Color initialTextColor =
      const Color.fromARGB(255, 139, 241, 84); // Primary text color
  static Color hoverInTextColor = Colors.black; // Hover In text color
  static Color initialBgColor = Colors.transparent; // Primary background color
  static Color hoverInBgColor = Colors.black; // Hover In background color
  static Color hoverOutTextColor =
      const Color.fromARGB(255, 139, 241, 84); // Hover Out text color
  static Color hoverOutBgColor =
      Colors.transparent; // Hover Out background color
}

//  Nav Item Colors
class NavItemColors {
  static Color initialTextColor = Colors.white; // Primary text color
  static Color hoverInTextColor =
      const Color.fromARGB(255, 139, 241, 84); // Hover In text color
  static Color hoverOutTextColor = Colors.white; // Hover Out text color
}

const bgColor = Color.fromRGBO(0, 0, 0, 1);
