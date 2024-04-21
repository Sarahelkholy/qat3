import 'package:flutter/material.dart';

import '../../constants.dart';
import '../Products/CurvedEdges.dart';
import 'ImageSliderContent.dart';
class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CurvedEdges(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Stack(
            children: [
              SafeArea(
                child: SizedBox(
                  height: 310,
                  child: Center(
                    child: Image.asset('images/products/T-shirt1.jpg',width: 400,height: 450,),
                  ),
                ),
              ),
              Positioned(
                right: 10,
                bottom: 3,
                left: 24,
                child: SizedBox(
                  height: 60,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics:const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (_,index)=>ImageSliderContent(
                      onTab: (){},
                      width: 60,
                      color: Colors.white,
                      border: Border.all(color: KLightGray),
                      padd: const EdgeInsets.symmetric(vertical: 5),
                      imageURL:'images/products/T-shirt1.jpg' ,
                    ),
                    separatorBuilder: (_, __)=>const SizedBox(width: 10,),
                    itemCount: 6,
                  ),
                ),
              ),
             ListTile(
               leading: IconButton(
                 onPressed: (){
                   Navigator.pop(context);
                 } ,
                 icon: const Icon(Icons.arrow_back,color: KDarkBlue,size: 30,weight: 50,),
               ),
               trailing:IconButton(
                 onPressed: (){} ,
                 icon: const Icon(Icons.favorite_outline,color: KDarkBlue,size: 25,weight: 10,),
               ),
             )

            ],
          ),
        ),
      ),
    );
  }
}

