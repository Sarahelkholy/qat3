import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class HelperFunction{
  static Color? getColor(String value){
    if(value=='White'){
      return Colors.white;
    } else if(value=='Black'){
      return Colors.black;
    }else if(value=='Gray'){
      return Colors.black12;
    }else if(value=='BabyBlue'){
      return Colors.blueGrey[100];
    }
    else if(value=='Red'){
      return Colors.red;
    }else if(value=='Yellow'){
      return Colors.yellow;
    }else if(value=='Orange'){
      return Colors.orange;
    }else if(value=='Blue'){
      return Colors.blue;
    }
    else if(value=='Green'){
      return Colors.green;
    }
    else if(value=='Beige'){
      return Color(0xffCFC1A8);
    }
    return null;
  }

  static String getFormatedDate(DateTime date,{String format='dd MMM yyyy'}){
    return DateFormat(format).format(date);
  }

}