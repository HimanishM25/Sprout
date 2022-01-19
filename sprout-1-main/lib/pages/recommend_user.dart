// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:animate_do/animate_do.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sprout/model_data/colors.dart';
import 'package:sprout/widgets/common/appBar.dart';
import 'package:sprout/widgets/home_page/weatherCard.dart';
import 'package:unicons/unicons.dart';

import 'detail_user.dart';

class Recommended extends StatefulWidget {
  @override
  _RecommendedState createState() => _RecommendedState();
}

List<List<dynamic>> dataSet = [];

class _RecommendedState extends State<Recommended> {
  ///////////////////////////////////////////

  void _loadCSV() async {
    final _rawData = await rootBundle.loadString("lib/Dataset/sprout.csv");
    List<List<dynamic>> listData =
        const CsvToListConverter(shouldParseNumbers: true).convert(_rawData);
    setState(() {
      dataSet = listData;
    });
  }

  //////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: NewAppBar("Recommendations"),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(15.w),
            child: ListView.builder(
              itemCount: dataSet.length,
              itemBuilder: (_, index) {
                if (dataSet[index][4] <= sendTemp &&
                    sendTemp <= dataSet[index][5])
                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: PlantDetail(index))),
                    child: FadeInUp(
                      child: Container(
                        height: 105.h,
                        child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 0,
                            color: Shade.cloud,
                            child: Padding(
                              padding: EdgeInsets.all(13.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(dataSet[index][12]),
                                  Text(
                                    dataSet[index][1],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        color: Shade.smoke,
                                        fontSize: 16.sp),
                                  ),
                                  Text(
                                    dataSet[index][2],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Shade.ash,
                                        fontSize: 16.sp),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                  );
                return SizedBox();
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          isExtended: true,
          backgroundColor: Shade.smoke,
          elevation: 0,
          onPressed: () => _loadCSV(),
          label: Text(
            "Recommend",
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          icon: Icon(UniconsSolid.favorite),
          splashColor: Colors.transparent,
        ));
  }
}

//////////////////////////////////////////////////////////////////////////////////
