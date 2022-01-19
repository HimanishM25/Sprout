import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sprout/firebase/signInButton.dart';
import 'package:sprout/model_data/colors.dart';

import 'authentication.dart';

class SignIn extends StatefulWidget {
  const SignIn({ Key? key }) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: 
              Center(
                child: Column(
                  children: 
                  [
                    Spacer(),

                    SvgPicture.asset("assets/images/svg/google.svg",width: 70.h,),

                    SizedBox(height: 30.h,),

                    Text("Join in with Google!",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w800,
                      color: Shade.smoke
                    ),),

                    SizedBox(height: 25.h,),


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

                ////////////////////////////////////////////////////////
                
                






                /////////////////////////////////////////////////////////





                Spacer()
                  ],
                )
  
              ),
          ),
        ),
    
    );
  }
}