import 'package:flutter/material.dart';

import '../../../widgets/Bars/Appbar.dart';
import '../../../widgets/Containers/OrderContainer.dart';
class OrderScreen extends StatelessWidget {
  static const id='OrderScreen';

  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Appbar(showBackArrow: true,title: 'My Orders',height: 70,padd: const EdgeInsets.only(top: 45),),
      body: const Padding(
        padding: EdgeInsets.all(15.0),
        child: OrderContainer(),
      ),
    );
  }
}
