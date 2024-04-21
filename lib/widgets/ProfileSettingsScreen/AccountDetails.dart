import 'package:flutter/material.dart';

import '../../Screens/Profile/ProfileScreen.dart';
import '../../constants.dart';
class AccountDetails extends StatelessWidget {
  const AccountDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: KBackground,
        radius: 20,
        child:Image.asset('images/logos/user.png',width: 28,height: 28,),
      ),
      title: const Text('Sarah Elkholy',style: TextStyle(color: KDarkBlue,fontSize: 16,fontWeight: FontWeight.w500),),
      subtitle: Text('Sarah@gmail.com',style: TextStyle(color: KDarkBlue.withOpacity(.5),fontSize: 14,fontWeight: FontWeight.w300),),
      trailing: IconButton(onPressed: (){
        Navigator.pushNamed(context, ProfileScreen.id);
      },icon: const Icon(Icons.edit_note_rounded,color: KDarkBlue,size: 30,),),
    );
  }
}
