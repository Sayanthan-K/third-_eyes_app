import 'dart:async';

import 'package:flutter/material.dart';
import 'package:thired_eyes/Screens/LoginPage.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isVisible = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // fun();
  }

  // late String userid;
  // late String token;
  // void fun() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  //   userid = await sharedPreferences.getString("_id")!;
  //   token = await sharedPreferences.getString("token")!;
  //   print("funhhhhh");
  //   print(userid);
  //   print(token);
  // }

  _SplashScreenState() {
    new Timer(const Duration(milliseconds: 2000), () async {
      print("heelo");
      // late String userid;
      // late String token;

      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginPage()),
            (route) => false);
      });
    });

    new Timer(Duration(milliseconds: 10), () {
      setState(() {
        _isVisible =
            true; // Now it is showing fade effect and navigating to Login page
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: [
            Theme.of(context).accentColor,
            Theme.of(context).primaryColor
          ],
          begin: const FractionalOffset(0, 0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0,
        duration: Duration(milliseconds: 1200),
        child: Center(
          child: Container(
            height: 150.0,
            width: 150.0,
            child: Center(
              child: ClipOval(
                child: Container(
                  child: new Image.asset(
                    // "lib/assets/Appicons/appicon.png",
                    "lib/assets/images/spalsh.png",
                    width: 110.0,
                    height: 110.0,
                  ),
                ),
              ),
            ),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 2.0,
                    offset: Offset(5.0, 3.0),
                    spreadRadius: 2.0,
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
