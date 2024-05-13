import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qat3/Loader/Shimmer/ShimmerEffect.dart';
class ImageSliderContent extends StatelessWidget {
  final VoidCallback? onTab;
  final double? width,hight;
  final double circularborder;
  final EdgeInsetsGeometry? padd;
  final Color? color;
  final bool isnetworkimage;
  final BoxBorder? border;
  final bool applyImage;
  final BoxFit? fit;
  final String imageUrl;

  const ImageSliderContent({super.key, this.onTab, this.width, this.hight,this.circularborder=8, this.padd, this.color, this.isnetworkimage=false, this.border, this.applyImage=true, this.fit=BoxFit.contain, required this.imageUrl});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTab,
      child: Container(
        width: width,
        height:hight ,
        padding:padd,
        decoration: BoxDecoration(
            color: color,
            border: border,
        borderRadius: BorderRadius.circular(circularborder)),
        child: isnetworkimage
          ?CachedNetworkImage(
          fit: fit,
          progressIndicatorBuilder: (context,url,downloadProgress)=>
          ShimmerEffect(width: width??double.infinity , height: hight??158),
          errorWidget: (context,url,error)=>Icon(Icons.error),
          imageUrl: imageUrl,):
            Image(image: AssetImage(imageUrl))
      ),
    );
  }
}
