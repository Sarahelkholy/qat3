import 'package:flutter/material.dart';
import 'package:qat3/constants.dart';
class AddRemove extends StatelessWidget {
  final int quantity;
  final VoidCallback? add,remove;
  const AddRemove({
    required this.quantity,this.add,this.remove
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            color: KDarkBlue.withOpacity(.6),
            borderRadius: BorderRadius.circular(100),
          ),
          child: InkWell(
              onTap: remove,
              child:const Icon(Icons.remove,size: 16,color: Colors.white,)),
        ),
        const SizedBox(width: 8,),
         Text(quantity.toString(),style: TextStyle(color: KDarkestColor,fontSize: 17),),
        const SizedBox(width: 8,),
        Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: KLightGray
          ),
          child: InkWell(
              onTap: add,
              child:const Icon(Icons.add,size: 16,color: Colors.white,)),),
      ],
    );
  }
}