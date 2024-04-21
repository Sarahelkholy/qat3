import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../constants.dart';
class Ratingbar extends StatelessWidget {
  final double rate;
  const Ratingbar({super.key, 
    required this.rate
  });

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
        rating: rate,
        itemSize: 20,
        unratedColor: KLightGray.withOpacity(.5),
        itemBuilder: (_,__)=>const Icon(Icons.star,color: KDarkBlue,)
    );
  }
}
