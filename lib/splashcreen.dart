// views/splash_screen.dart
import 'dart:async';

import 'package:commande_de_garage/view/login_screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';







class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      _navigateToHome();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25,),
            child: Image.asset('assets/images/entrepot.png', width: 232, height: 172),
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 0.0),
            child: Text(
              'the gate',
              style: TextStyle(
                fontSize: 23,
                fontFamily: 'Helvetica Neue',
                letterSpacing: -0.34,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, bottom: 0.0),
            child: Center(
              child: Text(
                'Commande de garage .',
                textAlign: TextAlign.center, // Added to ensure text is centered horizontally
                style: TextStyle(
                  fontSize: 23,
                  fontFamily: 'Helvetica Neue',
                  letterSpacing: -0.34,
                  color: Colors.grey,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }

  void _navigateToHome() {
    Get.offAll(LoginScreen());
  }
}


