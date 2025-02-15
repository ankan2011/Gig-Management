import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:note_application/Check_fun/wrapper.dart';
import 'package:note_application/Color/custom_color.dart';
import 'package:note_application/View/Onbord/onboardPages/onboard_secondpage.dart';
import 'package:note_application/View/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widget/Custom_title_and_subtitle.dart';
import '../../widget/custom_button.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {

  Future writeData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('is_first_time', false);
    // print("Data stored sucess");
  }

  // Future readData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final isFirstTime = prefs.getBool("is_first_time") ?? true;
  //   print("Is First time $isFirstTime");
  // }
  //
  // Future deleteDAta() async{
  //   final prefs = await SharedPreferences.getInstance();
  //    prefs.remove("is_first_time");
  // }



  @override
  void initState() {
    super.initState();
    writeData();
    // readData();
    // deleteDAta();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(15
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height:250,
                  child: SvgPicture.asset("assets/images/event.svg",)),


              CustomTitleAndSubtitle(title: "Create Events",
                  subTitle: " Now very easy to create,host and  \nmanage your event with celebration"),

              // SizedBox(height: 20,),


              Column(
                children: [
                  CustomButton(title: "Next",
                    onTap: ()=> Get.off(OnboardSecondpage())),
                SizedBox(height: 10,),
                  CustomButton(title: "Skip",
                      textColor: Custom_color.primaryColor,
                      backgroundColor: Colors.transparent,
                      onTap: ()=> Get.offAll(WrapperState())),
                ],
              ),


              SizedBox(),




            ],
          ),
        ),
      ),


    ) ;
  }
}
