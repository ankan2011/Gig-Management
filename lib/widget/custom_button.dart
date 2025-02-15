import 'package:flutter/material.dart';
import 'package:note_application/Color/custom_color.dart';


class CustomButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final Color? backgroundColor;
  final Color? textColor;
  const CustomButton({super.key, required this.title, this.onTap, this.backgroundColor, this.textColor});

  @override
  Widget build(BuildContext context) {
    return
      InkWell(
        onTap: onTap,
        child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 12,
            ),
            //  width: 20,
            decoration: BoxDecoration(
              color: backgroundColor ?? Custom_color.primaryColor,
              borderRadius:  BorderRadius.circular(10),
            ),
            child:
            Center(
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: textColor ??  Colors.white),
            )),

            ),
      );
  }
}
