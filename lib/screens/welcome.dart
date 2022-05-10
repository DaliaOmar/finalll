// ignore_for_file: camel_case_types, avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, unnecessary_new

import 'package:flutter/material.dart';
import 'package:waste_collector/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'login.dart';
import 'signup.dart';

class welcome extends StatefulWidget {
  const welcome({Key? key}) : super(key: key);

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.white),
            ),
            Positioned(
                top: 0,
                right: -70,
                child: Opacity(
                    opacity: 0.5,
                    child: Container(
                      child: ClipPath(
                        clipper: BottomWaveClipper(),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 2,
                          decoration: BoxDecoration(color: greenLight),
                        ),
                      ),
                    ))),
            Positioned(
                top: 0,
                child: Opacity(
                    opacity: 0.5,
                    child: Container(
                      child: ClipPath(
                        clipper: BottomWaveClipper2(),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 2,
                          decoration: BoxDecoration(color: greenLight),
                        ),
                      ),
                    ))),
            Positioned(
              top: 0,
              child: Container(
                child: ClipPath(
                  clipper: BottomWaveClipper(),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [greenDark, greenLight])),
                  ),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 80),
                child: CarouselSlider(
                    items: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage('assets/photos/welcome1.png'),
                              fit: BoxFit.cover,
                            )),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage('assets/photos/welcome2.png'),
                              fit: BoxFit.cover,
                            )),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage('assets/photos/welcome3.png'),
                              fit: BoxFit.cover,
                            )),
                      )
                    ],
                    options: CarouselOptions(
                      height: 200,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      // onPageChanged: callbackFunction,
                      scrollDirection: Axis.horizontal,
                    ))),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
                child: Image(
                  image: AssetImage('assets/photos/Nablus-logo.png'),
                  height: 150,
                  width: 150,
                ),
              ),
            ),
            Center(
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 450, 0, 0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 1.4,
                    child: FlatButton(
                        onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>  login()));
                        },
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 60,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerRight,
                                  end: Alignment.centerLeft,
                                  colors: [
                                    greenLight,
                                    greenDark,
                                  ],
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: Center(
                              child: Text(
                                'تسجيل الدخول',
                                style: TextStyle(
                                  fontFamily: 'El Messiri',
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                            ))),
                  )),
            ),
            Center(
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 550, 0, 0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 1.4,
                    child: FlatButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const Signup()));
                        },
                        child: Text(
                          'لا تمتلك حساب ؟ إنشاء حساب جديد',
                          style: TextStyle(
                            fontFamily: 'El Messiri',
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        )),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height - 20);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset(size.width - (size.width / 3.25), size.height - 65);
    var secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class BottomWaveClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height - 20);

    var firstControlPoint = Offset(size.width / 4, size.height - 65);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset(size.width - (size.width / 3.25), size.height);
    var secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
