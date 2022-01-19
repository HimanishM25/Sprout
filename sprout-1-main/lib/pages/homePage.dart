import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout/firebase/userInfo.dart';
import 'package:sprout/model_data/colors.dart';
import 'package:sprout/widgets/common/appBar.dart';
import 'package:sprout/widgets/home_page/dayTime.dart';
import 'package:sprout/widgets/home_page/disease_scanner.dart';
import 'package:sprout/widgets/home_page/recommend_home.dart';
import 'package:sprout/widgets/home_page/weatherCard.dart';

class HomePage extends StatelessWidget {
  ////////////////////////////////////////////////////////////////
  // var firstName = '';
  //
  // String userFirstName(name) {
  //   for (var i = 0; i < name.length; i++) {
  //     if (name[i] != " ")
  //       firstName += name[i];
  //     else
  //       break;
  //   }
  //   return 'Hi, ${firstName}.\n';
  // }

  /////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewAppBar('sprout.'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            //////////////////// GREETING ////////////////////
            RichText(
              text: TextSpan(
                text: 'Hi, ${name}.\n',
                style: TextStyle(
                    fontFamily: 'Inter',
                    color: Shade.ash,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500),
                children: <TextSpan>[
                  TextSpan(
                      text: DayTime.dayTime(),
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Shade.smoke,
                          fontSize: 25.sp)),
                ],
              ),
            ),

            //////////////////// WEATHER CARD ////////////////////
            SizedBox(
              height: 20.h,
            ),

            WeatherCard(),

            //////////////////// REMINDER FEATURE ////////////////////
            // SizedBox(
            //   height: 10.h,
            // ),
            // UpcomingRem(),

            //////////////////// SEARCH & RECOMMEND ////////////////////
            SizedBox(
              height: 20.h,
            ),
            Recommend(),

            ////////////////// DISEASE SCANNER ////////////////////////
            SizedBox(
              height: 30.h,
            ),
            Text(
              "Scan your plant",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
            ),

            SizedBox(
              height: 10.h,
            ),
            Scanner()
          ],
        ),
      ),
    );
  }
}
