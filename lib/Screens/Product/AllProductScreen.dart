import 'package:flutter/material.dart';
import 'package:qat3/widgets/Bars/Appbar.dart';

import '../../widgets/Products/AllProducts.dart';

class AllProductScreen extends StatelessWidget {
  static const id='AllProductScreen';
  const AllProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(title: 'Popular Products',showBackArrow: true,height: 85,padd: const EdgeInsets.only(top: 35),),
      body: const SingleChildScrollView(
        child: AllProducts(),
      ),
    );
  }
}

