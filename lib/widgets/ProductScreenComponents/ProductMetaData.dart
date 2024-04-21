import 'package:flutter/material.dart';
import 'package:qat3/widgets/Products/ProductPrice.dart';
import 'package:qat3/widgets/Products/ProductTitleText.dart';
import '../../constants.dart';
import 'RatingScreenComponents/RatingSection.dart';

class ProductMetaData extends StatelessWidget {
  final bool OnSale;
  const ProductMetaData({super.key, this.OnSale=true});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //brand
        Text('Basic Look',style:TextStyle(color: KDarkestColor.withOpacity(.3),
            fontSize: 15,
            ), ),
        const SizedBox(height: 8,),
        //ProductName
        const ProductTitleText(title: 'Comfort T-shirt',size: 25,weight: FontWeight.w300,),
        const RatingSection(),
        //sale&price
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              if(OnSale) Container(
                height: 25,
                width: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: KLightGray.withOpacity(.5)
                ),
                child: const Center(
                  child: Text('20%',style: TextStyle(
                      color: KDarkestColor,
                      fontSize: 13,
                      fontWeight: FontWeight.bold
                  ),),
                ),
              ),
              const SizedBox(width: 6,),
              if(OnSale) const ProductPrice(price:'250',lineThrogh:true,),
              const SizedBox(width: 10,),
              const ProductPrice(price: '200')
            ],
          ),
        ),
        //ProductState
        const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Row(
            children: [
              ProductTitleText(title: 'Status:',size: 15,),
              SizedBox(width: 2,),
              Text('In Stock',style: TextStyle(color: KDarkestColor,fontSize: 13),)
            ],
          ),
        ),

      ],
    );
  }
}
