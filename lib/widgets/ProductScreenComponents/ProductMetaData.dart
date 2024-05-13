import 'package:flutter/material.dart';
import 'package:qat3/Controller/Products/ProductController.dart';
import 'package:qat3/Models/ProductModel.dart';
import 'package:qat3/widgets/Products/ProductPrice.dart';
import 'package:qat3/widgets/Products/ProductTitleText.dart';
import '../../constants.dart';
import 'RatingScreenComponents/RatingSection.dart';

class ProductMetaData extends StatelessWidget {
  ProductModel product;
  
   ProductMetaData({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    final controller=ProductController.instace;
    final sale=controller.calculateSalePercentage(product.price, product.salePrice);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //brand
        Text(product.brand!.name,style:TextStyle(color: KDarkestColor.withOpacity(.3),
            fontSize: 15,
            ), ),
        const SizedBox(height: 8,),
        //ProductName
         ProductTitleText(title: product.title,size: 25,weight: FontWeight.w400,),
        const SizedBox(height: 4,),
        //sale&price
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              if(sale!=null) Container(
                height: 25,
                width: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: KLightGray.withOpacity(.5)
                ),
                child:  Center(
                  child: Text('$sale%',style: TextStyle(
                      color: KDarkestColor,
                      fontSize: 13,
                      fontWeight: FontWeight.bold
                  ),),
                ),
              ),
              if(sale!=null) SizedBox(width: 6,),
              if(product.salePrice>0) ProductPrice(price:product.price.toString(),lineThrogh:true,size: 17,color: KDarkGray,),
              if(product.salePrice>0) SizedBox(width: 10,),
               ProductPrice(price: controller.getProductPrice(product),size: 17,)
            ],
          ),
        ),
        //ProductState
         Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Row(
            children: [
              ProductTitleText(title: 'Status:',size: 15,),
              SizedBox(width: 2,),
             Text(controller.getStockStatus(product.stock),style: TextStyle(color: KDarkestColor,fontSize: 15,fontWeight: FontWeight.w500),),

            ],
          ),
        ),
        const RatingSection(),

      ],
    );
  }
}
