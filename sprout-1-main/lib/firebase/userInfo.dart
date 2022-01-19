// ignore_for_file: prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout/firebase/signIn.dart';
import 'package:sprout/model_data/colors.dart';
import 'package:sprout/widgets/common/appBar.dart';

import 'authentication.dart';

var name;

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  late User _user;
  bool _isSigningOut = false;

  Route _routeToSignInScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SignIn(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  void initState() {
    _user = widget._user;
    name = _user.displayName;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewAppBar('Profile'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.h,
              ),

              _user.photoURL != null
                  ? ClipOval(
                      child: Material(
                        color: Colors.grey.withOpacity(0.3),
                        child: Image.network(
                          _user.photoURL!,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    )
                  : ClipOval(
                      child: Material(
                        color: Colors.grey.withOpacity(0.3),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Icon(
                            Icons.person,
                            size: 90,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
              SizedBox(height: 16.0),

              //////////////////////////////
              SizedBox(height: 8.0),
              Text(
                _user.displayName!,
                style: TextStyle(
                    color: Shade.smoke,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700),
              ),

              ////////////////////////
              SizedBox(height: 8.0),
              Text(
                '${_user.email!}',
                style: TextStyle(
                  color: Shade.smoke,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 40.0),
              Text(
                'You are currently signed in using your Google Account. For signing off, click the Sign Out button below',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Shade.ash,
                  fontSize: 16.sp,
                ),
              ),

              SizedBox(
                height: 50.h,
              ),

              Text(
                'This week\'s plant report',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
              ),

              SizedBox(height: 5.0.h),

              Container(
                width: double.maxFinite,
                height: 100.h,
                decoration: BoxDecoration(
                    color: Shade.mesh, borderRadius: BorderRadius.circular(7)),
              ),

              FadeIn(child: SizedBox(height: 16.0)),
              _isSigningOut
                  ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                  : Container(
                      width: double.maxFinite,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Shade.moss,
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          setState(() {
                            _isSigningOut = true;
                          });
                          await Authentication.signOut(context: context);
                          setState(() {
                            _isSigningOut = false;
                          });
                          Navigator.of(context)
                              .pushReplacement(_routeToSignInScreen());
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 6.0, bottom: 6.0),
                          child: Text(
                            'Sign Out',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
