import 'package:flutter/material.dart';
import 'package:qat3/constants.dart';

import '../../Screens/SubCategoryScreen.dart';
class CategoryContainer extends StatelessWidget {
  final int image;
  final String Name;
   const CategoryContainer(this.image,this.Name, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, SubCategoryScreen.id);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical:5,horizontal:10 ),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          children: [
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, SubCategoryScreen.id);
              },
              child: Image.asset('images/logos/$image.png',width: 27,height: 27),
            ),
            Text(Name,style: const TextStyle(
              color: KDarkBlue,
              fontSize: 15
            ),)
          ],
        ),
      ),
    ) ;
  }
}
