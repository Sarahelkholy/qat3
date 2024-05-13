import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qat3/Controller/OrderController.dart';
import 'package:qat3/constants.dart';
import 'package:qat3/widgets/Class/CloudHelperFunctions.dart';
class OrderContainer extends StatelessWidget {
  const OrderContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(OrderController());
    return FutureBuilder(
      future: controller.fetchUserOrder(),
      builder: (context, snapshot) {
        final emptywidget=Center(child: Text('Whoops! No orders yet',style: TextStyle(fontSize: 18,color: KLightGray),));
        final responce=CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,nothingFound: emptywidget);
        if(responce!=null) return responce;
        final orders=snapshot.data!;
        return ListView.separated(
            separatorBuilder: (_,__)=>const SizedBox(height: 8,),
            itemCount: orders.length,
          itemBuilder: (_,index){
            final order=orders[index];
             return Container(
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
                     Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(order.orderStatusText,style: TextStyle(color: KDarkBlue,fontSize: 15,fontWeight: FontWeight.w500),),
                          Text(order.formattedOrderDate,style: TextStyle(color: KDarkGray,fontSize: 10))
                        ],
                      ),
                    ),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios_rounded,color: KDarkBlue,size: 15,))
                  ],
                ),
                const SizedBox(height: 8,),
                 Row(
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
                              Text(order.id,style: TextStyle(color: KLightGray,fontSize: 10))
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
                              Text(order.formattedDeliveryDAte,style: TextStyle(color: KLightGray,fontSize: 10))
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          );} );
      }
    );
  }
}
