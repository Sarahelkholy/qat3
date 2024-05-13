import 'package:flutter/material.dart';
import 'package:qat3/constants.dart';

class ChepTheme{
  ChepTheme._();
  static ChipThemeData light =const ChipThemeData(
       checkmarkColor: KDarkBlue,
       disabledColor: Colors.white,
       labelStyle: TextStyle(color:KDarkBlue),
       selectedColor: KLightGray,
       showCheckmark: true,
       padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
       backgroundColor: Colors.white,
       side: BorderSide(color: KLightGray)
  );
}