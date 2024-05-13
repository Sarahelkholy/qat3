import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qat3/Loader/Shimmer/ShimmerEffect.dart';

class Circularimage extends StatelessWidget {
  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width,height,padding,radius;
  const Circularimage({Key? key, this.fit=BoxFit.cover, required this.image,  this.isNetworkImage=false, this.overlayColor, this.backgroundColor,  this.width=55,  this.height=55, this.padding=10, required this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius)
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Center(
          child: isNetworkImage?
          CachedNetworkImage(fit: fit,
              color: overlayColor,
              imageUrl: image,
          progressIndicatorBuilder: (context,url,downloadProgress)=>const ShimmerEffect(width: 40, height: 40,radius: 40,),
            errorWidget: (context,url,error)=>const Icon(Icons.error),
          )
          :Image(
            fit: fit,
            image: AssetImage(image),
            color: overlayColor,
          ),
        ),
      ),
    );
  }
}
