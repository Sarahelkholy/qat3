import 'package:flutter/material.dart';
import 'package:qat3/constants.dart';
import 'package:qat3/widgets/SectionHeading.dart';
class PaymentSection extends StatelessWidget {
  const PaymentSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SectionHeading(title: 'Payment method',buttontitle: 'Change',padd: EdgeInsets.zero,),
        Row(

          children: [
            SizedBox(
              width: 34,
                height: 23,
              child: Image.asset('images/cashicon.png'),
            ),
            const Text('Cash on delivery',style: TextStyle(color: KDarkestColor,fontWeight: FontWeight.w400,fontSize: 15),)

          ],
        )
      ],
    );
  }
}
