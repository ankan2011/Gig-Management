import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_application/View/Onbord/onboard.dart';
import 'package:note_application/View/Onbord/onboardPages/onboard_secondpage.dart';
import 'package:note_application/View/SplashScreen/splashScreen.dart';
import 'package:note_application/View/home.dart';
import 'package:note_application/View/note_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
         // scaffoldBackgroundColor:Custom_color.backgroundColor,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Splashscreen(),
      // home: HomePage(),
    );
  }
}

