import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:introduction_screen/introduction_screen.dart';
import 'package:spot_buy/Screens/LanguageScreen.dart';
import 'package:spot_buy/Utils/SpotColors.dart';
import 'package:spot_buy/Utils/SpotSharedPref.dart';

import 'HomeScreen.dart';


//import on board me dependency

class IntroScreen extends StatefulWidget{
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _IntroScreen();
  }

}

class _IntroScreen extends State<IntroScreen>{

  @override
  Widget build(BuildContext context) {

    //this is a page decoration for intro screen
    PageDecoration pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 24.0,
          fontWeight: FontWeight.w700,
          color:SpotColors.colorPrimary
      ),
      titlePadding: EdgeInsets.only(top: 20),//tile font size, weight and color
      bodyTextStyle:TextStyle(fontSize: 20.0, color:SpotColors.colorPrimary),
      //body text size and color
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 16.0),
      //decription padding
      imagePadding: EdgeInsets.all(20), //image padding
      boxDecoration:BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Colors.white,
            Colors.white,
            Colors.white,
            Colors.white,
          ],
        ),
      ), //show linear gradient background of page
    );

    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      //main background of screen
      pages: [ //set your page view here
        PageViewModel(
          title: "Let's Get Started",
          body: "It will let the user to know the nearest .\nlocation from where they can get the vehicle recharged.",
          image: introImage('assets/images/IntroScreen/ev.jpg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Let's Get Started",
          body: "Recognize the regarding nearest location, \nwherever they'll park their vehicles.",
          image: introImage('assets/images/IntroScreen/parke.jpeg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Let's Get Started",
          body: "it'll let the user comprehend their \nfavorite fuel station<br>and their name.",
          image: introImage('assets/images/IntroScreen/garden.jpeg'),
          decoration: pageDecoration,
        ),

        //add more screen here
      ],

      onDone: () => goHomepage(context), //go to home page on done
      onSkip: () => goHomepage(context), // You can override on skip
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip', style: TextStyle(color: SpotColors.colorPrimary,fontWeight:FontWeight.bold)),
      next: const Icon(Icons.arrow_forward, color: SpotColors.colorPrimary,),
      done: const Text('Getting Stated', style: TextStyle(
          fontWeight: FontWeight.w600, color:SpotColors.colorPrimary
      ),),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0), //size of dots
        color: Colors.black26, //color of dots
        activeSize: Size(14.0, 14.0),
        activeColor:SpotColors.colorPrimary, //color of active dot
        activeShape: RoundedRectangleBorder( //shave of active dot
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }

  void goHomepage(context){
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context){
          return const MaterialApp(
              home: LanguageScreen(),
          );
        }
        ), (Route<dynamic> route) => false);
    //Navigate to home page and remove the intro screen history
    //so that "Back" button wont work.
  }

  Widget introImage(String assetName) {
    //widget to show intro image
    return Align(
      child: Image.asset(assetName, width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}