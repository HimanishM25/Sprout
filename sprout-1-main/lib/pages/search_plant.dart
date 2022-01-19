// ignore_for_file: curly_braces_in_flow_control_structures, prefer_const_constructors

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout/pages/detail_user.dart';
import 'package:sprout/pages/recommend_user.dart';
import 'package:sprout/widgets/common/appBar.dart';

class SearchPlant extends StatefulWidget {
  String plantType;
  SearchPlant(this.plantType);
  @override
  _SearchPlantState createState() => _SearchPlantState();
}

class _SearchPlantState extends State<SearchPlant> {
  void _loadPlant() async {
    final _rawData = await rootBundle.loadString("lib/Dataset/sprout.csv");
    List<List<dynamic>> listData =
        const CsvToListConverter(shouldParseNumbers: true).convert(_rawData);
    setState(() {
      dataSet = listData;
    });
  }

  @override
  void initState() {
    _loadPlant();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NewAppBar(widget.plantType + 's'),
        body: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: [
              Expanded(
                  child: GridView.builder(
                itemCount: 40,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (BuildContext context, int index) {
                  if (dataSet[index][2] == widget.plantType)
                    return GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PlantDetail(index))),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Image.asset(
                                dataSet[index][12],
                                width: 100.w,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                dataSet[index][1].toString(),
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w800),
                              ),
                            ],
                          )),
                    );
                  else
                    return SizedBox.shrink();
                },
              )),
            ],
          ),
        ));
  }
}
