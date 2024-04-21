import 'package:flutter/material.dart';

class HelperColor{
  static Color? getColor(String value){
    if(value=='white'){
      return Colors.white;
    } else if(value=='black'){
      return Colors.black;
    }else if(value=='gray'){
      return Colors.black12;
    }else if(value=='babyblue'){
      return Colors.blueGrey[100];
    }
    else if(value=='red'){
      return Colors.red;
    }else if(value=='yellow'){
      return Colors.yellow;
    }else if(value=='orange'){
      return Colors.orange;
    }else if(value=='blue'){
      return Colors.blue;
    }
    return null;
  }

}