import 'package:flutter/material.dart';


class ChoiceChep extends StatelessWidget {
  final String label;
  late final bool selected;
  final   void Function(bool)?   onselected;
    ChoiceChep({required this.label,required this.selected,this.onselected});

  @override
  Widget build(BuildContext context) {
    return
     ChoiceChip(
     label:  Text(label),
     selected: selected,
     onSelected:onselected,
   //  labelPadding:isColor?const EdgeInsets.all(0):null ,
     );
  }
}


