// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:sprout/model_data/colors.dart';
import 'package:sprout/widgets/home_page/dayTime.dart';
import 'dart:math';

class WeatherCard extends StatefulWidget {
  @override
  _WeatherCardState createState() => _WeatherCardState();
}

///////////////////////////////////
var sendTemp;
///////////////////////////////////

class _WeatherCardState extends State<WeatherCard> {
  //////////////////// API VARIABLES ////////////////////

  var temperature;
  var address;
  var location;
  var weather;

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    address = '${place.subAdministrativeArea}, ${place.administrativeArea}';
    await address;
    final String apiEndpoint =
        ("https://api.openweathermap.org/data/2.5/weather?q=$address&units=metric&appid=cbf9c071f96e2af72aefe1863047f79d");
    final Uri url = Uri.parse(apiEndpoint);
    final response = await http.post(url);
    var results = await jsonDecode(response.body);
    setState(() {
      address = address;
      this.temperature = results['main']['temp'];
      this.weather = results['weather'][0]['main'];
      sendTemp = temperature.floor();
    });
  }

  Future getData() async {
    Position position = await _getGeoLocationPosition();
    location = 'Lat: ${position.latitude} , Long: ${position.longitude}';
    GetAddressFromLatLong(position);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  ///////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      height: 172.h,
      width: double.maxFinite,

      ////////// BOX DECORATION //////////

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: DayTime.resColor(weather)),
      ),

      ////////// CONTENT //////////

      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ////////// LOCATION //////////

              Text(
                address ?? "-",
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),

              ////////// TEMPERATURE //////////
              Text(
                temperature != null
                    ? (temperature.toInt()).toString() + "°C"
                    : '-',
                style: TextStyle(
                    fontSize: 45.sp,
                    fontWeight: FontWeight.w700,
                    color: weather == 'Rain' ? Colors.white : Shade.smoke),
              ),

              ////////// CONDITION //////////
              Text(
                weather != null ? weather.toString() : '-',
                style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),

          // Image
        ],
      ),
    );
  }
}
