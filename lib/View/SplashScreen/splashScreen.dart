import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_application/Check_fun/wrapper.dart';
import 'package:note_application/Color/custom_color.dart';
import 'package:note_application/View/Onbord/onboard.dart';
import 'package:note_application/View/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  Future checkState() async{
    final  prefs = await SharedPreferences.getInstance();
   bool isFirstime =  prefs.getBool('is_first_time') ?? true;
   print("Is First Time $isFirstime");
   
   if(isFirstime == true){
     Get.offAll(()=>OnBoardScreen());
   }else {
     Get.offAll(()=> WrapperState());
   }
  }

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(
            seconds: 3), (){
      Get.offAll(
          checkState()
      );
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
        //  crossAxisAlignment:CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Custom_color.primaryColor,
                  ),
                  child: Center(child: Text('Your\ngig\nManagement',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    fontSize: 40
                  ),)),
                )
          ],
        ),
      )
    );
  }
}
