import 'package:flutter/material.dart';

import '../../../constants.dart';
class RatingProgress extends StatelessWidget {
  final String text;
  final double value;
  const RatingProgress({super.key, 
   required this.text,
    required this.value
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1 ,child: Text(text,style: const TextStyle(color: KDarkGray,fontSize: 17),)),
        Expanded(
          flex: 10,
          child: SizedBox(
            
            width: MediaQuery.of(context).size.width *.5,
            child: Container(
              padding: const EdgeInsets.only(top: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: LinearProgressIndicator(
                  value: value,
                  minHeight: 15,
                  backgroundColor: KLightGray.withOpacity(.5),
                  valueColor:const AlwaysStoppedAnimation(KDarkBlue),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}