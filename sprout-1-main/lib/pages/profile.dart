import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sprout/firebase/authentication.dart';
import 'package:sprout/firebase/userInfo.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}



class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(



      body: Center(
        child: FlatButton(
          onPressed: () async {     
                
                // TODO: Add a method call to the Google Sign-In authentication

                User? user = await Authentication.signInWithGoogle(context: context);
                if (user != null) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => UserInfoScreen(
                        user: user,
                      ),
                    ),
                  );
                }

              }, 
          child: ElasticIn(
            child: Text("Switch to Profile",
            style: TextStyle(fontSize: 20,
            fontWeight: FontWeight.w700),),
          )),
      ),
    );
  }
}
