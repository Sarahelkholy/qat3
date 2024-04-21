import 'package:flutter/material.dart';
import '../../../constants.dart';


class RatingSection extends StatelessWidget {
  const RatingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 13.0),
          child: Row(
            children: [
              Icon(Icons.star,color: Colors.amber,size: 17,),
              SizedBox(width: 4.3,),
              Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(text: '5.0 ',style: TextStyle(color: KDarkestColor,fontSize: 17,fontWeight: FontWeight.w600)),
                        TextSpan(text: '(200 reviews)',style: TextStyle(color: KDarkestColor,fontSize: 13,fontWeight: FontWeight.w400))
                      ]
                  ))
            ],
          ),
        ),
        //IconButton(onPressed: (){}, icon: Icon(Icons.share,color: KDarkBlue))
      ],
    );
  }
}
