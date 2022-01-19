import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout/model_data/colors.dart';
import 'package:sprout/pages/ML_plant_scanner.dart';

class Scanner extends StatefulWidget {
  const Scanner({Key? key}) : super(key: key);

  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.w),
      height: 105.h,
      width: double.maxFinite,

      ////////// BOX DECORATION //////////

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Shade.mesh),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Detect Ailments',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17.sp),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                'Restore the vibrancy of \nyour plant hues.',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Shade.ash,
                    fontSize: 14.sp),
              )
            ],
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PlantScanner()),
              );
            },
            child: Container(
              alignment: Alignment.center,
              width: 100.w,
              height: 35.h,
              child: Text(
                "Scan",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            style: ButtonStyle(
                splashFactory: NoSplash.splashFactory,
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
                backgroundColor: MaterialStateProperty.all(Shade.p3)),
          )
        ],
      ),
    );
  }
}
