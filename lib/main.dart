import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:qat3/Data/Repositories/AuthenticationRepository.dart';
import 'Qat3.dart';
import 'firebase_options.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async{
  final WidgetsBinding widgetsBinding=WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);


  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,).then((FirebaseApp value) =>
  Get.put(AuthenticationRepository()));
  await Firebase.initializeApp();

  runApp( const QAT3());
}



