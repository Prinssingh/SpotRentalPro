import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spot_buy/Screens/HomeScreen.dart';

import 'DrawerScreens/Profile/UserProfileFilling.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String verificationID;
  const OtpVerificationScreen({Key? key, required this.verificationID}) : super(key: key);

  @override
  _OtpVerificationState createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerificationScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
 // FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationID = "";

  void verifyOTP() async{

    String otp = otpController.text.trim();

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationID, smsCode: otp);
    try{
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      if(userCredential.user!= null){
        Navigator.push(context, CupertinoPageRoute
          (builder: (context) => const UserProfileFilling()
        ));
      }
    } on FirebaseAuthException catch(ex){
      log(ex.code.toString());
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body:  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade50,
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            'assets/images/OtpScreen.png',
          ),
        ),
        const Text(
          "ENTER YOUR OTP",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 7,
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: otpController,
              maxLength: 6,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                counterText: "",
                  border: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(12)),
                  hintText: "Enter Your OTP"),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              verifyOTP();
            },
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 51, 47, 97)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(26.0),
                ),
              ),
            ),
            child: const Text("Verify")),
        const SizedBox(
          height: 16,
        ),
        const Spacer()
      ],
    )
    );
  }
}
