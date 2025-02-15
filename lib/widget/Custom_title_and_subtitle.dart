import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_application/Color/custom_color.dart';


class CustomTitleAndSubtitle extends StatelessWidget {
  final String title;
  final String subTitle;
  const CustomTitleAndSubtitle({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            textAlign: TextAlign.center,
           title,
            style: TextStyle(
                fontSize: 30,
                color: Custom_color.primaryColor,
                fontWeight: FontWeight.bold),
          ),
          Text(
            textAlign: TextAlign.center,
            subTitle,
          ),

        ],
      ),
    );
  }
}
