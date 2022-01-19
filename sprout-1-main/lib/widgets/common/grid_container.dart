import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout/model_data/colors.dart';

class GridCont extends StatefulWidget {
  const GridCont({Key? key}) : super(key: key);

  @override
  _GridContState createState() => _GridContState();
}

class _GridContState extends State<GridCont> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      decoration: const BoxDecoration(
        color: Shade.moss,
        borderRadius: BorderRadius.all(
          Radius.circular(25.0),
        ),
      ),
      padding: EdgeInsets.fromLTRB(0, 40.h, 0, 10.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/images/plantIcon/Fruit/Avocado.png',
              width: 100.w),
          Text(
            "Fruits",
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: Shade.smoke),
          ),
        ],
      ),
    );
  }
}
