import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home_screen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Color backgroundColor = const Color(0xffe9edf1);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: backgroundColor,
      systemNavigationBarColor: backgroundColor,
    ));

    return EasySplashScreen(
      logo: Image.asset('assets/app_icon.png'),
      title: const Text(
        "AgroLab",
        style: TextStyle(
          fontSize: 45,
          fontFamily: 'odibeeSans',
        ),
      ),
      backgroundColor: backgroundColor,
      showLoader: true,
      loadingText: const Text("Initializing..."),
      navigator: const HomeScreen(),
      durationInSeconds: 2,
    );
  }
}
