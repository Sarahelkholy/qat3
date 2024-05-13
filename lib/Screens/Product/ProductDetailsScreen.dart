import 'package:flutter/material.dart';
import 'package:qat3/Enums.dart';
import 'package:qat3/widgets/ProductScreenComponents/AddToCart.dart';
import 'package:qat3/widgets/ProductScreenComponents/ProductAttributes.dart';
import 'package:qat3/widgets/ProductScreenComponents/ProductMetaData.dart';
import 'package:qat3/widgets/ProductScreenComponents/ProductImageSlider.dart';
import 'package:qat3/widgets/SectionHeading.dart';
import 'package:readmore/readmore.dart';
import '../../Models/ProductModel.dart';
import '../../constants.dart';
import 'ProductReviewsScreen.dart';
class ProductDetails extends StatelessWidget {
  static const id='ProductDetails';
  final ProductModel product;

  const ProductDetails({ required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar:  AddToCart(product:product),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductImageSlider(product: product,),
            Padding(
                padding: const EdgeInsets.only(left: 20,right: 10,top: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 ProductMetaData(product: product),
               if(product.productType==ProductType.Variable.toString())  ProductAttributes(product: product),
                const SectionHeading(title: 'Description',padd: EdgeInsets.only(top: 13),showButton: false,),
                const SizedBox(height:10,),
                 ReadMoreText(
                 product.description,
                  style: TextStyle(color: KDarkestColor),
                  trimLines: 1,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Less',
                  moreStyle: TextStyle(color: KDarkestColor,fontWeight: FontWeight.bold,fontSize: 15),
                  lessStyle: TextStyle(color: KDarkestColor,fontWeight: FontWeight.bold,fontSize: 15),
                ),
                const SizedBox(height: 12,),
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

