import 'package:flutter/material.dart';
import 'package:qat3/constants.dart';

import 'Class/HelperColor.dart';

class ChoiceChep extends StatelessWidget {
  final String label;
  final bool selected;
  final void Function(bool)? onselected;
   const ChoiceChep({super.key, required this.label,required this.selected,this.onselected});

  @override
  Widget build(BuildContext context) {
    final isColor= HelperColor.getColor(label)!=null;
    return ChoiceChip(
      label:isColor?const SizedBox(height: 30,width: 30,):Container(
       height: 30,
          width: 30,
          decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(50)
          ) ,
          child: Center(child: Text(label))),
      selected: selected,
      onSelected:onselected,
      checkmarkColor: Colors.white,
      labelStyle: const TextStyle(color:KDarkestColor,fontSize: 12),
      shape: const CircleBorder(),
      labelPadding: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
      selectedColor: isColor?HelperColor.getColor(label):KBackground,
      side: selected? const BorderSide(color: KDarkGray):BorderSide(color: KLightGray.withOpacity(.4)) ,
      backgroundColor: isColor?HelperColor.getColor(label):KBackground.withOpacity(.5),
    );
  }
}


