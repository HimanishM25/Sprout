// ignore_for_file: prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sprout/firebase/authentication.dart';
import 'package:sprout/firebase/signIn.dart';
import 'package:sprout/firebase/signInButton.dart';
import 'package:sprout/model_data/colors.dart';
import 'package:sprout/widgets/common/sbutton.dart';
import 'package:connectivity/connectivity.dart';

class AuthPage extends StatefulWidget {
  @override
  State<AuthPage> createState() => _AuthPageState();
}

isConnectedToInternet() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.none) return false;
  return true;
}

class _AuthPageState extends State<AuthPage> {
  @override
  initState() {
    super.initState();
    NetworkCheck();
  }

  NetworkCheck() async {
    if (!await isConnectedToInternet()) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Center(child: Text('No internet connection'))));
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40.h,
            ),

            Center(
              child: Text(
                "sprout.",
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Shade.ash),
              ),
            ),

            SizedBox(height: 100.h),

            FadeIn(
              duration: const Duration(seconds: 1),
              child: Center(
                child: Container(
                    height: 200.h,
                    child: OverflowBox(
                        minHeight: 300.h,
                        maxHeight: 300.h,
                        child: LottieBuilder.asset(
                            "assets/images/lottie/spinning_carrot.json"))),
              ),
            ),

            SizedBox(height: 60.h),

            Text("SPROUT.",
                style: TextStyle(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w800,
                    color: Shade.smoke)),

            SizedBox(height: 35.h),

            Text("Gardening is cheaper than therapy",
                style: TextStyle(
                    fontSize: 21.sp,
                    fontWeight: FontWeight.w700,
                    color: Shade.smoke)),

            SizedBox(height: 8.h),

            Text("Also you get the Carrots!",
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Shade.ash)),

            SizedBox(height: 45.h),

            ///////////////////////////////////////////////
            FutureBuilder(
                  future: Authentication.initializeFirebase(context: context),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error initializing Firebase');
                    } else if (snapshot.connectionState == ConnectionState.done) {
                      return GoogleSignInButton();
                    }
                    return CircularProgressIndicator(
                      color: Shade.smoke,
                      backgroundColor: Shade.g1,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.amber,
                      ),
                    );
                  },
                ),

                SizedBox(height: 10.h,),


            FadeInUp(
                delay: const Duration(seconds: 2),
                child: SButton(
                  buttonText: "Use Email Address",
                  pressAction: () => showDialog(
                    context: context,
                    builder: (ctx) => ElasticIn(
                      child: AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17)),
                        title: Text(
                          "Sprouting Underway",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        content: Text(
                          "User Authentication using email address is still under progress. Please continue with Google.",
                          style: TextStyle(fontSize: 14.sp),
                        ),
                        actions: <Widget>[
                          TextButton(
                            style: ButtonStyle(
                                splashFactory: NoSplash.splashFactory),
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: Text(
                              "Okay",
                              style: TextStyle(
                                color: Shade.moss,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  buttonColor: Shade.smoke,
                  textColor: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}
