import 'package:flutter/material.dart';
import 'package:qat3/constants.dart';
class OrderContainer extends StatelessWidget {
  const OrderContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (_,__)=>const SizedBox(height: 8,), 
        itemCount: 4,
      itemBuilder: (_,index)=>Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color:KLightGray )
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(

              children: [
                const Icon(Icons.local_shipping_sharp,color: KDarkBlue,size: 30,),
                const SizedBox(width: 6,),
                const Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Processing',style: TextStyle(color: KDarkBlue,fontSize: 15,fontWeight: FontWeight.w500),),
                      Text('07 July 2024',style: TextStyle(color: KDarkGray,fontSize: 10))
                    ],
                  ),
                ),
                IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios_rounded,color: KDarkBlue,size: 15,))
              ],
            ),
            const SizedBox(height: 8,),
            const Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(Icons.shopping_bag,color: KDarkBlue,size: 30,),
                      SizedBox(width: 4,),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Order',style: TextStyle(color:KDarkGray ,fontSize: 15,fontWeight: FontWeight.w500),),
                          Text('07 July 2024',style: TextStyle(color: KLightGray,fontSize: 10))
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Icon(Icons.calendar_month,color: KDarkBlue,size: 30,),
                      SizedBox(width: 4,),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Shipping Date',style: TextStyle(color: KDarkGray,fontSize: 15,fontWeight: FontWeight.w500),),
                          Text('07 July 2024',style: TextStyle(color: KLightGray,fontSize: 10))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ), );
  }
}
