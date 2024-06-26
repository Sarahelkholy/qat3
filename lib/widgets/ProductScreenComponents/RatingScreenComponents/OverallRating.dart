import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'RatingProgress.dart';
class OverallRating extends StatelessWidget {
  const OverallRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(flex: 3,child: Text('4.8',style: TextStyle(color: KDarkBlue,fontSize: 60,fontWeight: FontWeight.w400),)),
        Expanded(
          flex: 7,
          child: Column(
            children: [
              RatingProgress(text: '5',value: 1,),
              RatingProgress(text: '4',value: .8,),
              RatingProgress(text: '3',value: .6,),
              RatingProgress(text: '2',value: .4,),
              RatingProgress(text: '1',value: .2,),
            ],
          ),
        )

      ],
    );
  }
}

