// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout/model_data/colors.dart';
import 'package:sprout/pages/homePage.dart';
import 'package:sprout/widgets/Nav_Home.dart';
import 'package:sprout/widgets/common/appBar.dart';
import 'package:sprout/widgets/reminder/notification_service.dart';
import 'package:sprout/widgets/reminder/utilities.dart';


class Reminder extends StatefulWidget {
  @override
  _ReminderState createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {
  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Allow Notifications'),
            content: const Text('Our app would like to send you notifications'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Don\'t Allow',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
              ),
              TextButton(
                  onPressed: () => AwesomeNotifications()
                      .requestPermissionToSendNotifications()
                      .then((_) => Navigator.pop(context)),
                  child: const Text(
                    'Allow',
                    style: TextStyle(
                      color: Color(0xffcae183),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ))
            ],
          ),
        );
      }
    });

    AwesomeNotifications().createdStream.listen((notification) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Your reminder has been scheduled.',
        ),
      ));
    });

    AwesomeNotifications().actionStream.listen((notification) {
      if (notification.channelKey == 'basic_channel' && Platform.isIOS) {
        AwesomeNotifications().getGlobalBadgeCounter().then(
              (value) =>
                  AwesomeNotifications().setGlobalBadgeCounter(value - 1),
            );
      }

      // Navigator.pushAndRemoveUntil(
      //   context,
      //   MaterialPageRoute(
      //     builder: (_) => HomePage(),
      //   ),
      //   (route) => route.isFirst,
      // );
    });
  }

  @override
  void dispose() {
    AwesomeNotifications().actionSink.close();
    AwesomeNotifications().createdSink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: NewAppBar('Set Reminder'),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Text('What time would you like to water your plants?',
              style: TextStyle
              (
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: Shade.smoke
              ),),

              SizedBox(height: 10.h,),

              Text('You can choose anytime but we recommend early in the morning.',
              style: TextStyle
              (
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Shade.ash
              ),),

              
              
              
              
              
              
              
              
              
              
              //////////////////////////////////////////////////////////////////////
              
              Container(
                height: 60,
                width: 200,
                child: TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xffB2B9F7)),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: () async {
                    NotificationWeekAndTime? pickedSchedule =
                        await pickSchedule(context);

                    if (pickedSchedule != null) {
                      createWaterReminderNotification(pickedSchedule);
                    }
                  },
                  child: const Text(
                    'Add a reminder',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
