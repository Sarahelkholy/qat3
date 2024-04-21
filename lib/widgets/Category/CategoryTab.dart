import 'package:flutter/material.dart';
import 'package:qat3/widgets/GrideLayout.dart';
import 'package:qat3/widgets/Products/ItemContainer.dart';

import '../SectionHeading.dart';
class CategoryTab extends StatelessWidget {
  const CategoryTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        shrinkWrap: true,
        physics:const NeverScrollableScrollPhysics() ,
        children: [
          Column(
            children: [
              SectionHeading(title: 'You might Like',showButton: true,onPress: (){},),
              GrideLayout(itemCount: 6, itemBuilder: (_,index){
                return const ItemContainer(Name: 'sweatshirt',
                  lable: 'Basic Hoodie',price: 480,SaleTag: true,sale: 50,brand: 'Basic Look',showborder: true,
                );
              })
            ],
          ),
        ],
      ),
    );
  }
}
