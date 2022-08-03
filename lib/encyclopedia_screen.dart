import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import 'app_info_screen.dart';
import 'home_screen.dart';

class Encyclopedia extends StatefulWidget {
  const Encyclopedia({Key? key}) : super(key: key);

  @override
  State<Encyclopedia> createState() => _EncyclopediaState();
}

class _EncyclopediaState extends State<Encyclopedia> {
  Color backgroundColor = const Color(0xffe9edf1);
  Color secondaryColor = const Color(0xffe1e6ec);
  Color accentColor = const Color(0xff2d5765);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (index) {
          //todo implement transition to other screens
          // print(index);
          if (index == 0) {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => Encyclopedia(),
            //   ),
            // );
          }
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          }
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AppInfoScreen(),
              ),
            );
          }
        },
        index: 0,
        backgroundColor: backgroundColor,
        color: secondaryColor,
        buttonBackgroundColor: backgroundColor,
        animationDuration: const Duration(
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/app_icon.svg',
                        width: 30,
                        height: 30,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text(
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
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    'assets/tensorflow-icontext.svg',
                    width: 40,
                    height: 40,
                  ),
                )
              ],
            ),
            LottieBuilder.asset(
              'assets/58375-plantas-y-hojas.json',
              width: 400,
              height: 100,
            ),
            Expanded(
              child: Neumorphic(
                margin: const EdgeInsets.only(
                  bottom: 20,
                  left: 20,
                  right: 20,
                ),
                style: NeumorphicStyle(
                  color: backgroundColor,
                  intensity: 20,
                  // depth: 20,
                  lightSource: LightSource.topLeft,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: NeumorphicText(
                        'Encyclopedia',
                        style: const NeumorphicStyle(
                          color: Colors.black,
                          // color: Colors.green.shade800,
                          intensity: 20,
                        ),
                        textStyle: NeumorphicTextStyle(
                          fontFamily: 'odibeeSans',
                          // letterSpacing: 10,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 10,
                        left: 10,
                        bottom: 10,
                      ),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          NeumorphicIcon(
                            Icons.lightbulb_rounded,
                            size: 15,
                            style: NeumorphicStyle(
                              color: accentColor,
                              intensity: 20,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              left: 5,
                            ),
                            child: NeumorphicText(
                              'Read more about crop diseases and preventive care measures',
                              style: const NeumorphicStyle(
                                color: Colors.black,
                                // color: Colors.green.shade800,
                                intensity: 20,
                              ),
                              textStyle: NeumorphicTextStyle(
                                // letterSpacing: 10,
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          String urls = "https://www.google.com/search?q=" 'Apple+plant+diseases+and+preventive+care+measures';
                          Uri url = Uri.parse(urls);
                          await launchUrl(url,
                              mode: LaunchMode.inAppWebView);
                        },
                        child: Container(
                          height: 130,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/eapple.jpg'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          margin: const EdgeInsets.fromLTRB(
                            10,
                            20,
                            10,
                            10,
                          ),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              margin: const EdgeInsets.only(
                                top: 10,
                                left: 20,
                              ),
                              child: Text(
                                'Apple',
                                style: TextStyle(
                                  color: backgroundColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          String urls = "https://www.google.com/search?q=" 'Bell+Pepper+plant+diseases+and+preventive+care+measures';
                          Uri url = Uri.parse(urls);
                          await launchUrl(url,
                              mode: LaunchMode.inAppWebView);
                        },
                        child: Container(
                          height: 130,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/ebellpepper.jpg'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          margin: const EdgeInsets.fromLTRB(
                            10,
                            0,
                            10,
                            10,
                          ),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              margin: const EdgeInsets.only(
                                top: 10,
                                left: 20,
                              ),
                              child: Text(
                                'Bell Pepper',
                                style: TextStyle(
                                  color: backgroundColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          String urls = "https://www.google.com/search?q=" 'Cherry+plant+diseases+and+preventive+care+measures';
                          Uri url = Uri.parse(urls);
                          await launchUrl(url,
                              mode: LaunchMode.inAppWebView);
                        },
                        child: Container(
                          height: 130,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/echerry.jpg'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          margin: const EdgeInsets.fromLTRB(
                            10,
                            0,
                            10,
                            10,
                          ),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              margin: const EdgeInsets.only(
                                top: 10,
                                left: 20,
                              ),
                              child: Text(
                                'Cherry',
                                style: TextStyle(
                                  color: backgroundColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          String urls = "https://www.google.com/search?q=" 'Corn+plant+diseases+and+preventive+care+measures';
                          Uri url = Uri.parse(urls);
                          await launchUrl(url,
                              mode: LaunchMode.inAppWebView);
                        },
                        child: Container(
                          height: 130,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/ecorn.jpg'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          margin: const EdgeInsets.fromLTRB(
                            10,
                            0,
                            10,
                            10,
                          ),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              margin: const EdgeInsets.only(
                                top: 10,
                                left: 20,
                              ),
                              child: Text(
                                'Corn',
                                style: TextStyle(
                                  color: backgroundColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          String urls = "https://www.google.com/search?q=" 'Grape+plant+diseases+and+preventive+care+measures';
                          Uri url = Uri.parse(urls);
                          await launchUrl(url,
                              mode: LaunchMode.inAppWebView);
                        },
                        child: Container(
                          height: 130,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/egrapes.jpg'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          margin: const EdgeInsets.fromLTRB(
                            10,
                            0,
                            10,
                            10,
                          ),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              margin: const EdgeInsets.only(
                                top: 10,
                                left: 20,
                              ),
                              child: Text(
                                'Grape',
                                style: TextStyle(
                                  color: backgroundColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          String urls = "https://www.google.com/search?q=" 'Peach+plant+diseases+and+preventive+care+measures';
                          Uri url = Uri.parse(urls);
                          await launchUrl(url,
                              mode: LaunchMode.inAppWebView);
                        },
                        child: Container(
                          height: 130,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/epeach.jpg'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          margin: const EdgeInsets.fromLTRB(
                            10,
                            0,
                            10,
                            10,
                          ),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              margin: const EdgeInsets.only(
                                top: 10,
                                left: 20,
                              ),
                              child: Text(
                                'Peach',
                                style: TextStyle(
                                  color: backgroundColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          String urls = "https://www.google.com/search?q=" 'Potato+plant+diseases+and+preventive+care+measures';
                          Uri url = Uri.parse(urls);
                          await launchUrl(url,
                              mode: LaunchMode.inAppWebView);
                        },
                        child: Container(
                          height: 130,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/epotato.jpg'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          margin: const EdgeInsets.fromLTRB(
                            10,
                            0,
                            10,
                            10,
                          ),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              margin: const EdgeInsets.only(
                                top: 10,
                                left: 20,
                              ),
                              child: Text(
                                'Potato',
                                style: TextStyle(
                                  color: backgroundColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          String urls = "https://www.google.com/search?q=" 'Rice+plant+diseases+and+preventive+care+measures';
                          Uri url = Uri.parse(urls);
                          await launchUrl(url,
                              mode: LaunchMode.inAppWebView);
                        },
                        child: Container(
                          height: 130,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/erice.jpg'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          margin: const EdgeInsets.fromLTRB(
                            10,
                            0,
                            10,
                            10,
                          ),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              margin: const EdgeInsets.only(
                                top: 10,
                                left: 20,
                              ),
                              child: Text(
                                'Rice',
                                style: TextStyle(
                                  color: backgroundColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          String urls = "https://www.google.com/search?q=" 'Tomato+plant+diseases+and+preventive+care+measures';
                          Uri url = Uri.parse(urls);
                          await launchUrl(url,
                              mode: LaunchMode.inAppWebView);
                        },
                        child: Container(
                          height: 130,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/etomato.jpg'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          margin: const EdgeInsets.fromLTRB(
                            10,
                            0,
                            10,
                            20,
                          ),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              margin: const EdgeInsets.only(
                                top: 10,
                                left: 20,
                              ),
                              child: Text(
                                'Tomato',
                                style: TextStyle(
                                  color: backgroundColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
