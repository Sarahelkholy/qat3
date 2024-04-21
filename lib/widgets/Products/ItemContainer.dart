import 'package:flutter/material.dart';
import 'package:qat3/constants.dart';

import '../../Screens/Product/ProductDetailsScreen.dart';
class ItemContainer extends StatelessWidget {
  final String Name;
  final String lable;
  final double price;
  final bool SaleTag;
  final int? sale;
  final String brand;
  final bool showborder;
  final double? productsize;
  const ItemContainer({super.key, required this.Name,required this.lable,required this.price,this.SaleTag=false,this.sale,required this.brand,this.showborder=false,this.productsize=160});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetails.id);
      },
      child: Container(
        padding: const EdgeInsets.only(left: 15,right: 15,top: 13,bottom: 10),
        decoration: BoxDecoration(
         border: showborder? Border.all(color: KLightGray.withOpacity(.3)):null,
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
        ),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){},
                  child:const Icon(Icons.favorite_border,color: KDarkBlue,size: 20)
                  ),
                if(SaleTag) Container(
                  alignment: Alignment.topLeft,
                  height: 20,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: KLightGray.withOpacity(.5)
                  ),
                  child: Center(
                    child: Text('$sale%',style: const TextStyle(
                        color: KDarkestColor,
                        fontSize: 10,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, ProductDetails.id);
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: Image.asset('images/products/$Name.jpg',height: productsize,width: productsize,),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(lable,
                  style: const TextStyle(
                    color: KDarkestColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w600
                ),),
                const SizedBox(height: 2,),
                Text(brand,style: TextStyle(color: KDarkestColor.withOpacity(.5),
                fontSize: 10),),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$price LE',style: const TextStyle(
                    color: KDarkestColor,
                    fontSize: 15,
                  fontWeight: FontWeight.w800
                ),),
                //add cart
                Container(
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(20),
                    color: KDarkBlue,
                  ),
                  child: const SizedBox(
                    height: 26,
                      width: 26,
                      child: Icon(Icons.add,color: Colors.white,size: 15,)),
                )
              ],
            )
          ],
        ) ,
      ),
    );
  }
}
