import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:note_application/Check_fun/wrapper.dart';
import 'package:note_application/View/home.dart';

import '../../../Color/custom_color.dart';
import '../../../widget/Custom_title_and_subtitle.dart';
import '../../../widget/custom_button.dart';

class OnboardSecondpage extends StatelessWidget {
  const OnboardSecondpage({super.key});

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
                  child: SvgPicture.asset("assets/images/check.svg",)),


              CustomTitleAndSubtitle(title: "Manage Timeline",
                  subTitle: "Make your event date & time in your timeline"),

              // SizedBox(height: 20,),

              Column(
                children: [
                  CustomButton(title: "Next",
                      onTap: ()=> Get.off(WrapperState())),
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
