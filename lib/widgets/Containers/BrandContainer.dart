import 'package:flutter/material.dart';
import 'package:qat3/constants.dart';
import '../../Screens/Brands/BrandProducts.dart';

class BrandContainer extends StatelessWidget {
  final String BrandName;
  const BrandContainer({super.key, required this.BrandName, });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, BrandProducts.id);
      },
      child: Container(
        padding: const EdgeInsets.only(left: 15,right: 15,top: 13,bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: KBackground.withOpacity(.5),
        ),
        child: Row(
          children: [
            Flexible(
              child: Container(
                child:Image.asset('images/logos/7.png',width: 30,height: 30),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(BrandName,style:const TextStyle(color: KDarkestColor,
                        fontSize: 14,
                    fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Text('255 products',style: TextStyle(
                      color: KDarkestColor.withOpacity(.4),
                      fontSize: 11
                    ),overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
