import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sprout/model_data/colors.dart';
import 'package:sprout/pages/carousel.dart';
import 'package:unicons/unicons.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            const Spacer(),

            // Header
            FadeIn(
              duration: const Duration(seconds: 4),
              child: Text(
                "Aloe from the other side!👋🏻",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Shade.smoke,
                ),
              ),
            ),

            SizedBox(
              height: 20.h,
            ),

            // Button
            FadeIn(
              delay: const Duration(seconds: 4),
              duration: const Duration(seconds: 2),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: TextButton(
                  onPressed: () => Navigator.pushReplacement(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: CarouselPage())),

                  ////////// Text //////////
                  child: Container(
                    alignment: Alignment.center,
                    height: 40.h,
                    // Constructor Call #2
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Take a quick tour now!",
                          style: TextStyle(
                              fontSize: 16.sp,
                              // Constructor Call #3
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 70.w,
                        ),
                        Icon(
                          UniconsSolid.arrow_circle_right,
                          color: Colors.white,
                          size: 30.w,
                        ),
                      ],
                    ),
                  ),

                  ////////// Styling //////////
                  style: ButtonStyle(
                      splashFactory: NoSplash.splashFactory,
                      // Constructor Call #4
                      backgroundColor: MaterialStateProperty.all(Shade.smoke),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ))),
                ),
              ),
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}
