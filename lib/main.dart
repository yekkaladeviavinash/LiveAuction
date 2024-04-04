import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:liveauction/pages/firstpage.dart';
import 'package:liveauction/pages/itempage_controller.dart';
import 'package:liveauction/pages/loading.dart';
import 'package:liveauction/pages/profilecontroller.dart';
import 'package:liveauction/pages/seller_controller.dart';
import 'package:liveauction/pages/todayauction_controller.dart';
import 'firebase_options.dart';
import 'package:liveauction/pages/login.dart';
import 'package:liveauction/pages/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    );
    await FirebaseAppCheck.instance.activate(
    // webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
    androidProvider: AndroidProvider.debug,
    // appleProvider: AppleProvider.appAttest,
  );
    Get.put(Sellercontroller());
    Get.put(ItemController());
    Get.put(Todayauctioncontroller());
    Get.put(Profilecontroller());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
    color: Color.fromARGB(255, 254, 254, 255),
    theme: ThemeData(
      textTheme: TextTheme(
        bodyText1: TextStyle(fontFamily: 'Roboto'),

      ),
    ),
    debugShowCheckedModeBanner: false,
    home: Loading(),
    );
  }
}
