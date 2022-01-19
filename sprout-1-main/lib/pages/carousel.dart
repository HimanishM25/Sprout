// ignore_for_file: prefer_const_constructors
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sprout/model_data/colors.dart';
import 'package:sprout/pages/authenticationPage.dart';
import 'package:sprout/widgets/carousel_page/skip_button.dart';
import 'package:sprout/widgets/common/sbutton.dart';
import 'package:unicons/unicons.dart';

class CarouselPage extends StatefulWidget {
  @override
  _CarouselPageState createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  ///////////////////////////// VARIABLE DECLARATIONS //////////////////////////////
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      height: 5.0,
      width: isActive ? 40 : 20,
      decoration: BoxDecoration(
        color: isActive ? Shade.smoke : Shade.g1,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
    );
  }

  //////////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ///////////////// SKIP BUTTON ///////////////

              Skip(_currentPage,_numPages),

              SizedBox(
                height: 100.h,
              ),

              /////////////// CARD ///////////////
              FadeIn(
                child: Container(
                  height: 500.h,
                  child: PageView(
                    physics: BouncingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      // Carousel Cards
                      Padding(
                        padding: EdgeInsets.all(20.0.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Center(
                                child: SvgPicture.asset(
                              "assets/images/svg/search.svg",
                              width: 200.w,
                            )),
                            SizedBox(height: 70.0.h),
                            Text(
                              'Search or Get Recommended',
                              style: TextStyle(
                                  fontSize: 24.sp, fontWeight: FontWeight.w800),
                            ),
                            SizedBox(height: 15.0.h),
                            Text(
                              'Come in and look around, or let us make a recommendation for the ideal plant for your spot!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Shade.ash),
                            ),
                          ],
                        ),
                      ),

                      //// 2nd Card

                      Padding(
                        padding: EdgeInsets.all(20.0.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Center(
                                child: SvgPicture.asset(
                              "assets/images/svg/water_reminder.svg",
                              width: 200.w,
                            )),
                            SizedBox(height: 70.0.h),
                            Text(
                              'Set A Reminder',
                              style: TextStyle(
                                  fontSize: 24.sp, fontWeight: FontWeight.w800),
                            ),
                            SizedBox(height: 15.0.h),
                            Text(
                              'A built-in reminder that you may customise to fit your needs. Never forget to care for your plants now!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Shade.ash),
                            ),
                          ],
                        ),
                      ),

                      ///// 3rd Card

                      Padding(
                        padding: EdgeInsets.all(20.0.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Center(
                                child: SvgPicture.asset(
                              "assets/images/svg/diseases.svg",
                              width: 200.w,
                            )),
                            SizedBox(height: 70.0.h),
                            Text(
                              'Detect Plant Disease',
                              style: TextStyle(
                                  fontSize: 24.sp, fontWeight: FontWeight.w800),
                            ),
                            SizedBox(height: 15.0.h),
                            Text(
                              'Make sure you detect the ailment as early as possible and get care! Get to know the cures as soon as possible.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Shade.ash),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 20.h,
              ),

              //////////////// FAB ///////////////////

              _currentPage != _numPages - 1
                  ? Container(
                      height: 51.5.h,
                      
                      child: FloatingActionButton(
                        onPressed: () {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                        elevation: 0,
                        splashColor: Colors.transparent,
                        highlightElevation: 0,
                        backgroundColor: Shade.moss,
                        child: Icon(UniconsLine.arrow_right),
                      ),
                    )
                  : FadeIn(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        child: SButton(
                            buttonText: "Get Started",
                            pressAction: () => Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.fade,
                                    child: AuthPage())),
                            buttonColor: Shade.smoke),
                      ),
                    ),

              /////////////////////////////////////////////
              SizedBox(
                height: 80.h,
              ),

              //////////////// SLIDERS ///////////////////

              FadeIn(
                delay: Duration(seconds: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
