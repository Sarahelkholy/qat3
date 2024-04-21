import 'package:flutter/material.dart';
import '../../GrideLayout.dart';
import '../../Products/ItemContainer.dart';
import '../../SectionHeading.dart';

class SubCategorySection extends StatelessWidget {
  final String Sectiontitle;
  final int itemscount;
  final String Name;
  final String lable;
  final double price;
  final bool SaleTag;
  final int? sale;
  final String brand;
  final bool showborder;
  const SubCategorySection({super.key, required this.Sectiontitle,required this.itemscount, required this.Name, required this.lable, required this.price,  this.SaleTag=false, this.sale, required this.brand,  this.showborder=true});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeading(title:Sectiontitle ,onPress: (){} ,padd: const EdgeInsets.only(left: 10,right: 5),),
        GrideLayout(itemCount: itemscount,itemBuilder: (_,index){
          return SafeArea(
            child: ItemContainer(Name: Name,
              lable: lable,price: price,brand: brand,
              sale: sale,SaleTag: SaleTag,showborder: showborder,productsize: 90,
            ),
          );
        },
        mainAxis: 240,)
      ],
    );
  }
}
