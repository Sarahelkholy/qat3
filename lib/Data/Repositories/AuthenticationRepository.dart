import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:qat3/Data/LocalStorage.dart';
import 'package:qat3/Data/Repositories/UserRepositories.dart';
import 'package:qat3/Screens/Start/LoginScreen.dart';
import 'package:qat3/Screens/Start/VerifyemailScreen.dart';
import 'package:qat3/Screens/Start/WelcomeScreen.dart';
import 'package:qat3/widgets/NavigationMenu.dart';

class AuthenticationRepository extends GetxController {
 static AuthenticationRepository get instance=>Get.find();
 final devicestorage=GetStorage();
 final _auth=FirebaseAuth.instance;
 User? get authUser=>_auth.currentUser;


 @override
  void onReady() {
   FlutterNativeSplash.remove();
   screenRedirect();

  }

  void screenRedirect() async{
   final user=_auth.currentUser;
   if(user!=null){
     if(user.emailVerified){
       await LocalStorage.init(user.uid);
       Get.offAll(()=>const NavigationMenu());
     }
      else{
        Get.offAll(()=>VerifyemailScreen(email:  _auth.currentUser?.email,));
     }
   }
   else{
     devicestorage.writeIfNull('IsFirstTime', true);
     devicestorage.read('IsFirstTime')!= true
         ?Get.offAll(()=>const LoginScreen()):
         Get.offAll(()=>const WelcomeScreen());
   }
 }

    //login
    Future<UserCredential> loginWithEmailandPassword(String email,String password) async{
      try{
     return await _auth.signInWithEmailAndPassword(email: email, password: password);
      }on FirebaseAuthException catch(e){
        throw FirebaseAuthException(code: '$e');
      }on FirebaseException catch(e){
        throw FirebaseAuthException(code: '$e');
      }on FormatException catch(_){
        throw const FormatException();
      }on PlatformException catch(e){
        throw PlatformException(code: '$e');
      }
      catch(e){
        throw 'Something went wrong. please try again';
      }
    }

    //google sign in
    Future<UserCredential?> signinwithGoogle() async{
   try{
    final GoogleSignInAccount? userAccount=await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth=await userAccount?.authentication;
    final credential=GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken,idToken:googleAuth?.idToken );
    return await _auth.signInWithCredential(credential);
   }on FirebaseAuthException catch(e){
     throw FirebaseAuthException(code: '$e');
   }on FirebaseException catch(e){
     throw FirebaseAuthException(code: '$e');
   }on FormatException catch(_){
     throw const FormatException();
   }on PlatformException catch(e){
     throw PlatformException(code: '$e');
   }
   catch(e){
     throw 'Something went wrong. please try again';
   }
 }

    //register
    Future<UserCredential> registerWithEmailandPassword(String email,String password) async{
   try{
     return await _auth.createUserWithEmailAndPassword(email: email, password: password);
   }on FirebaseAuthException catch(e){
     throw FirebaseAuthException(code: '$e');
   }on FirebaseException catch(e){
     throw FirebaseAuthException(code: '$e');
   }on FormatException catch(_){
     throw const FormatException();
   }on PlatformException catch(e){
     throw PlatformException(code: '$e');
   }
   catch(e){
     throw 'Something went wrong. please try again';
   }
    }

    //Verify email
    Future<void> sendEmailVerification() async{
   try{
     await _auth.currentUser?.sendEmailVerification();
   }on FirebaseAuthException catch(e){
     throw FirebaseAuthException(code: '$e');
   }on FirebaseException catch(e){
     throw FirebaseAuthException(code: '$e');
   }on FormatException catch(_){
     throw const FormatException();
   }on PlatformException catch(e){
     throw PlatformException(code: '$e');
   }
   catch(e){
     throw 'Something went wrong. please try again';
   }
    }

    //ForgetPassword
    Future<void> sendPasswordResetEmail(String email) async{
   try{
     await _auth.sendPasswordResetEmail(email: email);
   }on FirebaseAuthException catch(e){
     throw FirebaseAuthException(code: '$e');
   }on FirebaseException catch(e){
     throw FirebaseAuthException(code: '$e');
   }on FormatException catch(_){
     throw const FormatException();
   }on PlatformException catch(e){
     throw PlatformException(code: '$e');
   }
   catch(e){
     throw 'Something went wrong. please try again';
   }
 }

    //logout
    Future<void> logout() async{
   try{
     await GoogleSignIn().signOut();
     await FirebaseAuth.instance.signOut();
     Get.offAll(()=>const WelcomeScreen());
   }on FirebaseAuthException catch(e){
     throw FirebaseAuthException(code: '$e');
   }on FirebaseException catch(e){
     throw FirebaseAuthException(code: '$e');
   }on FormatException catch(_){
     throw const FormatException();
   }on PlatformException catch(e){
     throw PlatformException(code: '$e');
   }
   catch(e){
     throw 'Something went wrong. please try again';
   }

    }

    //re_auth
    Future<void> reAuthenticateWithEmailAndPassword(String email,String password) async{
   try{
     AuthCredential credential=EmailAuthProvider.credential(email: email, password: password);
     await _auth.currentUser!.reauthenticateWithCredential(credential);
   }on FirebaseAuthException catch(e){
     throw FirebaseAuthException(code: '$e');
   }on FirebaseException catch(e){
     throw FirebaseAuthException(code: '$e');
   }on FormatException catch(_){
     throw const FormatException();
   }on PlatformException catch(e){
     throw PlatformException(code: '$e');
   }
   catch(e){
     throw 'Something went wrong. please try again';
   }

 }

    //delete user
    Future<void> deleteAccount() async{
   try{
    await UserRepoistory.instance.removeUserRecord(_auth.currentUser!.uid);
    await _auth.currentUser?.delete();
   }on FirebaseAuthException catch(e){
     throw FirebaseAuthException(code: '$e');
   }on FirebaseException catch(e){
     throw FirebaseAuthException(code: '$e');
   }on FormatException catch(_){
     throw const FormatException();
   }on PlatformException catch(e){
     throw PlatformException(code: '$e');
   }
   catch(e){
     throw 'Something went wrong. please try again';
   }

 }
}
