import 'package:flutter/cupertino.dart';

class DayTime {
  ////////// CURRENT TIME GREETING //////////
  static String dayTime() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning!';
    }
    if (hour < 17) {
      return 'Good Afternoon!';
    }
    return 'Good Evening!';
  }

  ////////// WEATHER CARD GRADIENT //////////
  static List<Color> resColor(condition) {
    // HAZE
    if (condition == 'Haze')
      return [Color(0xffECE6E2), Color(0xff9CBBD2)];

    // THUNDERSTORM
    else if (condition == 'Thunderstorm')
      return [Color(0xffe6dada), Color(0xff274046)];

    // DRIZZLE
    else if (condition == 'Drizzle')
      return [Color(0xff4568DC), Color(0xffB06AB3)];

    // RAIN
    else if (condition == 'Rain')
      return [Color(0xff000046),Color(0xff1CB5E0)];

    // SNOW
    else if (condition == 'Snow')
      return [Color(0xff6190E8),Color(0xffA7BFE8)];

    // SMOKE
    else if (condition == 'Smoke')
      return [Color(0xffB993D6),Color(0xff8CA6DB)];

    // CLEAR
    else if (condition == 'Clear')
      return [Color(0xff7F7FD5),Color(0xff86A8E7),Color(0xff91EAE4)];

    // CLOUDS
    else if (condition == 'Clouds')
      return [Color(0xffa8c0ff),Color(0xff3f2b96)];
    else
      return [Color(0xffacb6e5), Color(0xff86fde8)];
  }
}
