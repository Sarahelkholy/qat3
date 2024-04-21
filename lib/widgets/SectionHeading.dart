import 'package:flutter/material.dart';

import '../constants.dart';
class SectionHeading extends StatelessWidget {
  final String title,buttontitle;
  final bool showButton;
  final VoidCallback? onPress;
  final EdgeInsetsGeometry padd;

  const SectionHeading({super.key, required this.title,this.buttontitle ='view all',this.showButton=true, this.onPress,this.padd=const EdgeInsets.symmetric(vertical: 8,horizontal: 20)});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padd,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: const TextStyle(color: KDarkBlue,
          fontWeight: FontWeight.bold,
          fontSize: 20),maxLines: 1,overflow: TextOverflow.ellipsis,),
          if (showButton) TextButton(onPressed: onPress, child: Text(buttontitle,style: TextStyle(
            color: KDarkBlue.withOpacity(.6)
          ),)),
        ],
      ),
    );
  }
}
