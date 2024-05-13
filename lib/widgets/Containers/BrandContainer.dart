import 'package:flutter/material.dart';
import 'package:qat3/Models/BrandModel.dart';
import 'package:qat3/constants.dart';
import 'package:qat3/widgets/Containers/Circularimage.dart';
import '../../Screens/Brands/BrandProducts.dart';

class BrandContainer extends StatelessWidget {
  final BrandModle brand;
  final void Function()? ontap;
  const BrandContainer({super.key, required this.brand,this.ontap });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: KBackground.withOpacity(.5),

        ),
        child: Row(
          children: [
            Flexible(
              child:Circularimage(
                radius: 35,
                image: brand.image,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(brand.name,style:const TextStyle(color: KDarkestColor,
                        fontSize: 14,
                    fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Text('${brand.productCount} products',style: TextStyle(
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
