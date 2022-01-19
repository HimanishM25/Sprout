import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sprout/model_data/colors.dart';
import 'package:sprout/pages/recommend_user.dart';
import 'package:sprout/widgets/common/sbutton.dart';

class Recommend extends StatelessWidget {
  const Recommend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
      width: double.maxFinite,

      ////////// BOX DECORATION //////////

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Shade.mesh),

      ////////// CHILD ///////////////////

      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Get Recommendations',
              style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w700,
                  color: Shade.smoke),
            ),
            Text(
              'We\'ll assist you in selecting the most thriving and appropriate plant!',
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Shade.ash),
            ),
            SButton(
                buttonText: "Get Recommended",
                pressAction: () => Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade, child: Recommended())),
                buttonColor: Shade.p2)
          ],
        ),
      ),
    );
  }
}
