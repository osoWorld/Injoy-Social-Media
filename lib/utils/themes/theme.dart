import 'package:flutter/material.dart';

import 'custom_theme/appbar_theme.dart';
import 'custom_theme/bottom_sheet_theme.dart';
import 'custom_theme/checkbox_theme.dart';
import 'custom_theme/chip_theme.dart';
import 'custom_theme/elevated_button_theme.dart';
import 'custom_theme/outlined_button_theme.dart';
import 'custom_theme/text_theme.dart';
import 'custom_theme/textfield_theme.dart';

class CFSAppTheme {
  CFSAppTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: "Outfit",
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      textTheme: CFSTextTheme.lightTextTheme,
      chipTheme: CFSChipTheme.lightChipTheme,
      elevatedButtonTheme: CFSElevatedButtonTheme.lightElevatedThemeButton,
      outlinedButtonTheme: CFSOutlinedButtonTheme.lightOutlinedButtonTheme,
      appBarTheme: CFSAppBarTheme.lightAppBarTheme,
      bottomSheetTheme: CFSBottomSheetTheme.lightBottomSheetTheme,
      checkboxTheme: CFSCheckBoxTheme.lightCheckBoxTheme,
      inputDecorationTheme: CFSTextFieldTheme.lightInputDecorationTheme);

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: "Outfit",
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      textTheme: CFSTextTheme.darkTextTheme,
      chipTheme: CFSChipTheme.darkChipTheme,
      elevatedButtonTheme: CFSElevatedButtonTheme.darkElevatedThemeButton,
      outlinedButtonTheme: CFSOutlinedButtonTheme.darkOutlinedButtonTheme,
      appBarTheme: CFSAppBarTheme.darkAppBarTheme,
      bottomSheetTheme: CFSBottomSheetTheme.darkBottomSheetTheme,
      checkboxTheme: CFSCheckBoxTheme.darkCheckBoxTheme,
      inputDecorationTheme: CFSTextFieldTheme.darkInputDecorationTheme);
}
