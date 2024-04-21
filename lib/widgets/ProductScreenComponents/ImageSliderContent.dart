import 'package:flutter/material.dart';
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
  final String imageURL;
  const ImageSliderContent({super.key, this.onTab, this.width, this.hight,this.circularborder=8, this.padd, this.color, this.isnetworkimage=false, this.border, this.applyImage=true, this.fit=BoxFit.contain, required this.imageURL});

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
        child: ClipRRect(
          borderRadius: applyImage? BorderRadius.circular(circularborder):BorderRadius.zero,
          child: Image(fit: fit,image: isnetworkimage ? NetworkImage(imageURL):AssetImage(imageURL) as ImageProvider,),
        ),
      ),
    );
  }
}
