import 'package:flutter/material.dart';
import '../../widgets/Bars/Appbar.dart';
import '../../widgets/Products/AllProducts.dart';
class BrandProducts extends StatelessWidget {
  static const id='BrandProductsScreen';
  const BrandProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(title: 'Basic Look',showBackArrow: true,height: 80,padd: const EdgeInsets.only(top: 40),),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: AllProducts(),
        ),
      ),
    );
  }
}
