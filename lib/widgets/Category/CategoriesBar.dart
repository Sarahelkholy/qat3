import 'package:flutter/material.dart';

import 'CategoryContainer.dart';
class CategoriesBar extends StatelessWidget {
  const CategoriesBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.only(left: 10),
        child: Row(

          children: [
            CategoryContainer(1, 'T-shirts'),
            CategoryContainer(7, 'pants'),
            CategoryContainer(6, 'Footwear'),
            CategoryContainer(8, 'Bags'),
            CategoryContainer(2, 'Accessorize'),
            CategoryContainer(3, 'Make up'),
            CategoryContainer(5, 'Skin care'),
          ],
    ),
      ),
    );
  }
}
