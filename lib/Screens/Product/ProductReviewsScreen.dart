import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../widgets/Bars/Appbar.dart';
import '../../widgets/Bars/Ratingbar.dart';
import '../../widgets/ProductScreenComponents/RatingScreenComponents/OverallRating.dart';
import '../../widgets/ProductScreenComponents/RatingScreenComponents/UserReview.dart';
class ProductReviewsScreen extends StatelessWidget {
  static const id='ProductReviewsScreen';
  const ProductReviewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(title: 'Reviews & Ratings',showBackArrow: true,height: 80,padd: const EdgeInsets.only(top: 35),),
      backgroundColor: Colors.white,
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 18,top: 7,right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Ratings and reviews are verified and are from people who use this product ',style: TextStyle(color: KDarkestColor,fontSize: 14),),
              SizedBox(height: 12,),
              OverallRating(),
              SizedBox(height: 3,),
              Ratingbar(rate: 3.5,),
              Text('200',style: TextStyle(color: Colors.grey,),),
              SizedBox(height: 20,),
              UserReview(),
              UserReview(),
              UserReview(),

            ],
          ),
        ),
      ),
    );
  }
}



