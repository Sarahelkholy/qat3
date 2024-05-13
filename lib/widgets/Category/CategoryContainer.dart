import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qat3/constants.dart';
import 'package:qat3/widgets/Containers/Circularimage.dart';

import '../../Loader/Shimmer/ShimmerEffect.dart';
import '../../Screens/SubCategoryScreen.dart';
class CategoryContainer extends StatelessWidget {
  final String image;
  final String Name;
  final bool isNetworkImage;
  final BoxFit? fit;
  final Color? overlayColor;
  final VoidCallback ontap;
   const CategoryContainer({super.key,required this.image,required this.Name ,  this.isNetworkImage=false, this.fit=BoxFit.cover, this.overlayColor, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical:5,horizontal:10 ),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          children: [
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, SubCategoryScreen.id);
              },
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
            Text(Name,style: const TextStyle(
              color: KDarkBlue,
              fontSize: 15
            ),)
          ],
        ),
      ),
    ) ;
  }
}
