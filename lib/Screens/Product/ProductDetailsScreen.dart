import 'package:flutter/material.dart';
import 'package:qat3/widgets/ProductScreenComponents/AddToCart.dart';
import 'package:qat3/widgets/ProductScreenComponents/ProductAttributes.dart';
import 'package:qat3/widgets/ProductScreenComponents/ProductMetaData.dart';
import 'package:qat3/widgets/ProductScreenComponents/ProductImageSlider.dart';
import 'package:qat3/widgets/SectionHeading.dart';
import 'package:readmore/readmore.dart';

import '../../constants.dart';
import 'ProductReviewsScreen.dart';
class ProductDetails extends StatelessWidget {
  static const id='ProductDetails';
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const AddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
           const ProductImageSlider(),
            Padding(
                padding: const EdgeInsets.only(left: 20,right: 10,top: 12),
            child: Column(
              children: [
                const ProductMetaData(),
                const ProductAttributes(),
                const SectionHeading(title: 'Description',padd: EdgeInsets.only(top: 13),showButton: false,),
                const SizedBox(height:12,),
                const ReadMoreText(
                  'this is the product description on the brand website jkhkjgfdgjgyuglliukjhkuhyiuff',
                  style: TextStyle(color: KDarkestColor),
                  trimLines: 1,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Less',
                  moreStyle: TextStyle(color: KDarkestColor,fontWeight: FontWeight.bold,fontSize: 15),
                  lessStyle: TextStyle(color: KDarkestColor,fontWeight: FontWeight.bold,fontSize: 15),
                ),
                const SizedBox(height: 12,),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SectionHeading(title: 'Reviews',showButton: false,padd: EdgeInsets.zero,),
                    const Expanded(flex:10,child: Text('(200)',style: TextStyle(color: Colors.grey,fontSize: 14),)),
                    Expanded(
                      flex: 1,
                      child: IconButton(onPressed: (){
                        Navigator.pushNamed(context, ProductReviewsScreen.id);
                      }, icon: const Icon(Icons.arrow_forward_ios_rounded,size: 15,color: KDarkBlue,)),
                    )
                  ],
                ),
                const SizedBox(height: 15,),
              ],
            ),
            )
          ],
        ),
      ),
    );
  }
}

