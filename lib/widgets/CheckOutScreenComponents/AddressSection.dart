import 'package:flutter/material.dart';
import 'package:qat3/constants.dart';
import 'package:qat3/widgets/SectionHeading.dart';
class AddressSection extends StatelessWidget {
  const AddressSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(title: 'Shipping address',buttontitle: 'Change',padd: EdgeInsets.zero,),
        SizedBox(height: 2,),
        Text('Sarah Elkholy',style: TextStyle(color: KDarkestColor,fontSize: 16,fontWeight: FontWeight.w400),),
        SizedBox(height: 6,),
        Row(

          children: [
            Icon(Icons.phone,color: KDarkestColor,),
            SizedBox(width: 6,),
            Text('+201008637092',style: TextStyle(color: KDarkestColor,fontSize: 15,fontWeight: FontWeight.w400))
          ],
        ),
        SizedBox(height: 6,),
        Row(
          children: [
            Icon(Icons.location_on,color: KDarkestColor,),
            SizedBox(width: 6,),
            Text('Egypt,cairo,22 elmaady',style: TextStyle(color: KDarkestColor,fontSize: 15,fontWeight: FontWeight.w600))
          ],
        )
      ],
    );
  }
}
