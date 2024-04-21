import 'package:flutter/material.dart';

import '../../widgets/Bars/Appbar.dart';
import '../../widgets/Containers/BrandContainer.dart';
import '../../widgets/GrideLayout.dart';
class AllBrandScreen extends StatelessWidget {
  static const id='AllBrandScreen';
  const AllBrandScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Appbar(title: 'Brands',showBackArrow: true,height: 80,padd: const EdgeInsets.only(top: 40),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              GrideLayout(itemCount: 6,itemBuilder: (_,index){
                return const BrandContainer(BrandName: 'Basic Look');
              },mainAxis: 80,)
            ],
          ),
        ),
      ),
    );
  }
}
