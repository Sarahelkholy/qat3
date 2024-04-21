import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../constants.dart';
import '../../Bars/Ratingbar.dart';
class UserReview extends StatelessWidget {
  const UserReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(backgroundColor: KBackground.withOpacity(.5),radius: 22,child: Image.asset('images/logos/user.png',height: 30,width: 30,),),
                const SizedBox(width: 10,),
                const Text('Omar Mohamed',style: TextStyle(color: KDarkestColor),)
              ],
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert,color: KDarkBlue,))
          ],
        ),
        const SizedBox(height: 10,),
        const Row(
          children: [
            Ratingbar(rate: 4,),
            SizedBox(width: 10,),
            Text('07 June 2023',style: TextStyle(color: Colors.grey),)
          ],
        ),
        const SizedBox(height: 12,),
        const ReadMoreText(
          'the user interface of this app is very good,i was able to navigate from screen to another quickly',
          style: TextStyle(color: KDarkestColor),
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Show more',
          trimExpandedText: 'Less',
          moreStyle: TextStyle(color: KDarkestColor,fontWeight: FontWeight.bold,fontSize: 15),
          lessStyle: TextStyle(color: KDarkestColor,fontWeight: FontWeight.bold,fontSize: 15),
        ),
        const SizedBox(height: 25,)
      ],
    );
  }
}
