import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout/model_data/colors.dart';

class UpcomingRem extends StatefulWidget {
  const UpcomingRem({ Key? key }) : super(key: key);

  @override
  _UpcomingRemState createState() => _UpcomingRemState();
}

class _UpcomingRemState extends State<UpcomingRem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 5.h),
      height: 130.h,
      width: double.maxFinite,

      ////////// BOX DECORATION //////////

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Shade.g2,width: 1.5)
        ),


      ////////// CHILD ///////////////////
      
      child: Column(
        children: 
        [
          Container(
            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Shade.g2,width: 1.5))),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: 
                [
                  Text("Upcoming Reminders",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 17.sp,
                    color: Shade.whale
                  ),),


                  IconButton(
                    onPressed: (){}, 
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: Icon(Icons.add,size: 25.w,color: Shade.smoke,))
                ],
              ),
            ),
          ),

          Row()
        ],
      ),
    
      );
  }
}