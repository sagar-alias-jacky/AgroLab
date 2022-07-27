import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import 'encyclopedia_screen.dart';
import 'home_screen.dart';

class AppInfoScreen extends StatefulWidget {
  const AppInfoScreen({Key? key}) : super(key: key);

  @override
  State<AppInfoScreen> createState() => _AppInfoScreenState();
}

class _AppInfoScreenState extends State<AppInfoScreen> {
  Color backgroundColor = Color(0xffe9edf1);
  Color secondaryColor = Color(0xffe1e6ec);
  Color accentColor = Color(0xff2d5765);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (index) {
          //todo implement transition to other screens
          print(index);
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Encyclopedia(),
              ),
            );
          }
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          }
          if (index == 2) {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => AppInfoScreen(),
            //   ),
            // );
          }
        },
        index: 2,
        backgroundColor: backgroundColor,
        color: secondaryColor,
        buttonBackgroundColor: backgroundColor,
        animationDuration: Duration(
          milliseconds: 300,
        ),
        items: [
          NeumorphicIcon(
            Icons.menu_book_rounded,
            style: NeumorphicStyle(
              color: accentColor,
              intensity: 20,
            ),
          ),
          NeumorphicIcon(
            Icons.home_rounded,
            style: NeumorphicStyle(
              color: accentColor,
              intensity: 20,
            ),
          ),
          NeumorphicIcon(
            Icons.info_rounded,
            style: NeumorphicStyle(
              color: accentColor,
              intensity: 20,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          // padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/app_icon.svg',
                          width: 30,
                          height: 30,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "AgroLab",
                            style: TextStyle(
                              fontFamily: 'odibeeSans',
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: SvgPicture.asset(
                      'assets/tensorflow-icontext.svg',
                      width: 40,
                      height: 40,
                    ),
                  )
                ],
              ),
              Expanded(
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Neumorphic(
                          padding: EdgeInsets.all(10),
                          style: NeumorphicStyle(
                            color: accentColor,
                            intensity: 20,
                            depth: 20,
                          ),
                          child: Text(
                            'Our Team',
                            style: TextStyle(
                              fontFamily: 'odibeeSans',
                              fontSize: 35,
                              color: backgroundColor,
                            ),
                          ),
                        ),
                        Container(
                          child: LottieBuilder.asset(
                            'assets/106709-hanging-plant-gently-swinging.json',
                            height: 100,
                          ),
                        ),
                        Row(
                          children: [
                            Neumorphic(
                              margin: EdgeInsets.only(
                                left: 20,
                              ),
                              style: NeumorphicStyle(
                                border: NeumorphicBorder(
                                  color: accentColor,
                                  width: 2,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image(
                                  width: 150,
                                  height: 150,
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/sagarp.png'),
                                ),
                              ),
                            ),
                            Neumorphic(
                              margin: EdgeInsets.only(
                                left: 20,
                              ),
                              style: NeumorphicStyle(
                                border: NeumorphicBorder(
                                  color: accentColor,
                                  width: 2,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image(
                                  width: 150,
                                  height: 150,
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/paulg.jpg'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Neumorphic(
                              margin: EdgeInsets.only(
                                top: 20,
                                left: 20,
                              ),
                              style: NeumorphicStyle(
                                border: NeumorphicBorder(
                                  color: accentColor,
                                  width: 2,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image(
                                  width: 150,
                                  height: 150,
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/varunc.jpg'),
                                ),
                              ),
                            ),
                            Neumorphic(
                              margin: EdgeInsets.only(
                                left: 20,
                                top: 20,
                              ),
                              style: NeumorphicStyle(
                                border: NeumorphicBorder(
                                  color: accentColor,
                                  width: 2,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image(
                                  width: 150,
                                  height: 150,
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/nihalm.jpg'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Neumorphic(
                          padding: EdgeInsets.all(
                            10,
                          ),
                          style: NeumorphicStyle(
                            color: backgroundColor,
                            intensity: 20,
                            depth: 5,
                          ),
                          margin: EdgeInsets.only(
                            top: 20,
                            left: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'About AgroLab',
                                style: TextStyle(
                                  fontFamily: 'odibeeSans',
                                  fontSize: 30,
                                  color: Colors.black,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  top: 10,
                                ),
                                child: Text(
                                  'AgroLab was created as part of our mini project work during the penultimate year of our CS Engineering Graduation course.\n\nAgroLab was developed with an intention to reduce the time taken to identify various plant diseases with a high detection accuracy. Early detection and counter measures will help prevent large scale losses to the farmers, also improving crop productivity.',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(
                            top: 20,
                            left: 20,
                          ),
                          child: SvgPicture.asset(
                            'assets/made-with-love-in-india.svg',
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(
                                top: 10,
                                left: 20,
                              ),
                              child: SvgPicture.asset(
                                'assets/flutter.svg',
                                width: 100,
                                height: 35,
                              ),
                            ), 
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(
                                top: 10,
                                left: 10,
                              ),
                              child: SvgPicture.asset(
                                'assets/tensorflow.svg',
                                width: 100,
                                height: 35,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
