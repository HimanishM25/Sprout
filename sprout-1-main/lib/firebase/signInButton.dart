// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sprout/model_data/colors.dart';
import 'package:sprout/widgets/Nav_Home.dart';
import 'authentication.dart';

class GoogleSignInButton extends StatefulWidget {
  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  static bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return _isSigningIn
        ? Center(
          child: SizedBox(
            height: 20.h,
            width: 20.w,
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Shade.smoke),
              ),
          ),
        )
        : FadeInUp(
            delay: const Duration(seconds: 1),
            child: TextButton(
              // Constructor Call #1
              onPressed: () async {
              setState(() {
                _isSigningIn = true;
              });

              // TODO: Add a method call to the Google Sign-In authentication

              User? user =
                  await Authentication.signInWithGoogle(context: context);

              setState(() {
                _isSigningIn = false;
              });

              if (user != null) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => NavHome()),
                );
              }
            },

              ////////// Text //////////
              child: Container(
                alignment: Alignment.center,
                height: 36.h,
                // Constructor Call #2
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/images/svg/google.svg",
                      width: 24.w,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "Continue with Google",
                      style: TextStyle(
                          fontSize: 16.sp,
                          // Constructor Call #3
                          color: Shade.g1,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),

              ////////// Styling //////////
              style: ButtonStyle(
                  splashFactory: NoSplash.splashFactory,
                  // Constructor Call #4
                  backgroundColor:
                      MaterialStateProperty.all(Color(0xffEBEBEB)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ))),
            ),
          );
  }
}
