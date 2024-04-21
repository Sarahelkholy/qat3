import 'package:flutter/material.dart';

class ChepTheme{
  ChepTheme._();
  static ChipThemeData light =const ChipThemeData(
      shape: CircleBorder(),
      disabledColor: Colors.white,
      labelStyle: TextStyle(color: Colors.black),
      selectedColor: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
  );
}