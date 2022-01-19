import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SButton extends StatelessWidget {
  ////////////////////////////////////////////////////////////

  final String buttonText;
  final VoidCallback pressAction;
  final Color textColor;
  final Color buttonColor;

  SButton(
      {
        required this.buttonText,
        this.textColor = Colors.white,
        required this.pressAction,
        required this.buttonColor
      });

  ////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return TextButton(
      // Constructor Call #1
      onPressed: pressAction,

      ////////// Text //////////
      child: Container(
        alignment: Alignment.center,
        height: 36.h,
        // Constructor Call #2
        child: Text(
          buttonText,
          style: TextStyle(
              fontSize: 16.sp,
              // Constructor Call #3
              color: textColor,
              fontWeight: FontWeight.w700),
        ),
      ),

      ////////// Styling //////////
      style: ButtonStyle(
          splashFactory: NoSplash.splashFactory,
          // Constructor Call #4
          backgroundColor: MaterialStateProperty.all(buttonColor),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ))),
    );
  }
}
