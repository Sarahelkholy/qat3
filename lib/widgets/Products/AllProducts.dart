import 'package:flutter/material.dart';

import '../../constants.dart';
import '../GrideLayout.dart';
import 'ItemContainer.dart';
class AllProducts extends StatelessWidget {
  const AllProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 18.0),
          child: DropdownButtonFormField(
            decoration: const InputDecoration(prefixIcon: Icon(Icons.sort,color: KDarkBlue,),border: InputBorder.none),
            onChanged: (value){},
            items: ['Name','Higher Price','Lower Price','Sales','Most Popular']
                .map((option) => DropdownMenuItem(value: option,child: Text(option,style: const TextStyle(color: KDarkBlue),))).toList(),
          ),
        ),
        GrideLayout(itemCount: 6,itemBuilder: (_,index){
          return const ItemContainer(Name: 'sweatshirt',
            lable: 'Basic Hoodie',price: 480,SaleTag: true,sale: 50,brand: 'Basic Look',
          );
        },)
      ],
    );
  }
}
