import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:introduction_screen/introduction_screen.dart';
import 'package:spot_buy/Screens/LanguageScreen.dart';
import 'package:spot_buy/Utils/SpotColors.dart';


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
      titleTextStyle: TextStyle(fontSize: 28.0,
          fontWeight: FontWeight.w700,
          color:SpotColors.colorPrimary
      ), //tile font size, weight and color
      bodyTextStyle:TextStyle(fontSize: 19.0, color:Colors.black),
      //body text size and color
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
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
          title: "Page 1",
          body: "Instead of having to buy an entire share, invest any amount you want.",
          image: introImage('assets/images/logo.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Page 2",
          body: "Instead of having to buy an entire share, invest any amount you want.",
          image: introImage('assets/images/logo.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Page 3",
          body: "Instead of having to buy an entire share, invest any amount you want.",
          image: introImage('assets/images/logo.png'),
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
          return const LanguageScreen();
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
}