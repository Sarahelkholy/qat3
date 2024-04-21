import 'package:flutter/material.dart';
import 'package:qat3/constants.dart';
class AddToCart extends StatelessWidget {
  const AddToCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
      decoration: BoxDecoration(
        color: KBackground.withOpacity(.4),

        borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Row(
              children: [
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: KDarkBlue.withOpacity(.6),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: IconButton(onPressed: (){},icon: const Icon(Icons.remove,size: 16,color: Colors.white,),),
                ),
                const SizedBox(width: 8,),
                const Text('2',style: TextStyle(color: KDarkestColor,fontSize: 20),),
                const SizedBox(width: 8,),
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: KLightGray
                  ),
                  child: IconButton(onPressed: (){},icon: const Icon(Icons.add,size: 16,color: Colors.white,),),
                ),
              ],
            ),
          ),
          ElevatedButton(onPressed: (){},
              style: ElevatedButton.styleFrom(
                backgroundColor: KDarkBlue,

              ),
              child: const Text('Add to cart',style: TextStyle(color: Colors.white),))
        ],
      ),
    );
  }
}
