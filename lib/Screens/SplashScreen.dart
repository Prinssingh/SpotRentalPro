import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spot_buy/Screens/HomeScreen.dart';
import 'package:spot_buy/Screens/IntroScreen.dart';
import 'package:spot_buy/Screens/DrawerScreens/Profile/UserProfileFilling.dart';

import 'LanguageScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {

  Widget directOpening(){

    return (FirebaseAuth.instance.currentUser != null) ? const HomeScreen() : const IntroScreen();

  }

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
            () =>
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => directOpening() ))
    );
  }

  // void ChooseScreen() async{
  //   Widget w = (FirebaseAuth.instance.currentUser!= null) : HomeScreen() ? const IntroScreen()
  // }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/images/logo.png'),
      ),
    );

  }
}