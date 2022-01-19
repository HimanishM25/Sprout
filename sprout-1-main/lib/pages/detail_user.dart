// ignore_for_file: prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout/model_data/colors.dart';
import 'package:sprout/pages/recommend_user.dart';
import 'package:sprout/widgets/common/appBar.dart';
import 'dart:math';

import 'package:sprout/widgets/common/sbutton.dart';

class PlantDetail extends StatefulWidget {
  int cardnum;
  PlantDetail(this.cardnum);

  @override
  _PlantDetailState createState() => _PlantDetailState();
}

class _PlantDetailState extends State<PlantDetail> {
  List<Color> backColor = [
    Color(0xffBAB8DE),
    Color(0xffEEB6EA),
    Color(0xffBCE3B4),
    Color(0xffF4BABF),
    Color(0xffF4EFC9),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor[Random().nextInt(5)],
      appBar: NewAppBar(dataSet[widget.cardnum][1]),
      body: Column(
        children: [
          FadeIn(
            child: Image.asset(
              dataSet[widget.cardnum][11],
              width: 250.w,
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Expanded(
            child: Stack(children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.45),
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(85))),
                width: double.maxFinite,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: FadeInUp(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(40, 40, 25, 0),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(75))),
                    child: ListView(
                      children: [
                        FadeInUp(
                          child: Text(
                            dataSet[widget.cardnum][1],
                            style: TextStyle(
                                fontSize: 30.sp,
                                color: Shade.smoke,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                        FadeInUp(
                          child: Text(
                            dataSet[widget.cardnum][2],
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Shade.ash),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        FadeInUp(
                          child: Text(
                            "Description",
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.w800),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          dataSet[widget.cardnum][10],
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w300,
                              color: Shade.ash),
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        FadeInUp(
                          child: Text(
                            "Water Requirements (in L)",
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.w800),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          dataSet[widget.cardnum][3],
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w300,
                              color: Shade.ash),
                        ),
                        FadeInUp(
                          child: SizedBox(
                            height: 25.h,
                          ),
                        ),
                        Text(
                          "Temperature Range:  ${dataSet[widget.cardnum][4]}-${dataSet[widget.cardnum][5]}°C",
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        FadeInUp(
                          child: Text(
                            "Common Plant Diseases",
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.w800),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          dataSet[widget.cardnum][6],
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w300,
                              color: Shade.ash),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        FadeInUp(
                          child: Text(
                            "Suitable Fertilizers",
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.w800),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          dataSet[widget.cardnum][8],
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w300,
                              color: Shade.ash),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        FadeInUp(
                          child: Text(
                            "Soil Type Required",
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.w800),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          dataSet[widget.cardnum][7],
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w300,
                              color: Shade.ash),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        SButton(
                            buttonText: "Add to Favorites",
                            pressAction: ()=> print(dataSet[widget.cardnum][12].runtimeType),
                            buttonColor: backColor[Random().nextInt(5)])
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
