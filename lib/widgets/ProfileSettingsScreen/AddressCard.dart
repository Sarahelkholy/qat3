import 'package:flutter/material.dart';
import 'package:qat3/constants.dart';
class AddressCard extends StatelessWidget {
  final bool selected;
  const AddressCard({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        decoration: BoxDecoration(
          border:selected?Border.all(color:KDarkGray ):Border.all(color: KLightGray.withOpacity(.4)) ,
          borderRadius: BorderRadius.circular(20),
          color: selected? KBackground.withOpacity(.5):Colors.white
        ),
        margin: const EdgeInsets.only(bottom: 14),
        child: Stack(
          children: [
            Positioned(
              right: 5,
              top: 0,
              child: Icon(
                selected?Icons.check_circle:null,
                color: selected?KDarkBlue.withOpacity(.6):null,
              ),
            ),
            const Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sarah Elkholy',maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(color: KDarkestColor,fontWeight: FontWeight.bold),),
                SizedBox(height: 4,),
                Text('+201008637092',maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(color: KDarkestColor),),
                SizedBox(height: 4,),
                Text('Egypt ,Cairo ,hilkonjgtyuguj',maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(color: KDarkestColor),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
