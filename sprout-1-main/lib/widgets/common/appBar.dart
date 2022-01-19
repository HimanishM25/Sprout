import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout/model_data/colors.dart';

class NewAppBar extends StatelessWidget implements PreferredSizeWidget {
////////////////////////////////////////////////////////////////////////////////

  // Constructor Variables
  String? text;
  bool? iconNeed = false;

  // Constructor
  NewAppBar(this.text);

////////////////////////////////////////////////////////////////////////////////

  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Shade.smoke),
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        text!,
        style: TextStyle(
            fontSize: 18.sp, fontWeight: FontWeight.w900, color: Shade.smoke),
      ),
      centerTitle: true,
    );
  }
}
