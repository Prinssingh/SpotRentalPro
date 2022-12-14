import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spot_buy/Screens/OtpVerificationScreen.dart';
import 'package:spot_buy/Utils/SpotSharedPref.dart';


enum LoginScreen { SHOW_MOBILE_ENTER_WIDGET, SHOW_OTP_FORM_WIDGET }

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  LoginScreen currentState = LoginScreen.SHOW_MOBILE_ENTER_WIDGET;
  FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationID = "";


  void sendOTP() async {
    String phone = "+91" + phoneController.text.trim();
    //Set Mobile Number to SharedPrefs
    SpotSharedPref.setUserMobile(phone);
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        codeSent: (verificationID,resendToken) {
          Navigator.push(context, CupertinoPageRoute
            (builder: (context) => OtpVerificationScreen(
              verificationID : verificationID
          )
          ));
        },
        verificationCompleted: (credentials) {},
        verificationFailed: (ex){
          log(ex.code.toString());
        },
        codeAutoRetrievalTimeout: (verificationID){},
      timeout: Duration(seconds: 30)
    );
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      backgroundColor:  Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade50,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              'assets/images/LoginScreen2.png',
            ),
          ),
          const Text(
            "Verify Your Phone Number",
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
                controller: phoneController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: "Mobile Number"),
                style: const TextStyle(fontSize: 22),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: (){
                sendOTP();
                // Navigator.of(context).pushAndRemoveUntil(
                //     MaterialPageRoute(builder: (context){
                //       return  sendOTP();
                //     }
                //     ), (Route<dynamic> route) => false);
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 51, 47, 97)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                ),
              ),
              child: const Text("Send OTP")),
          const SizedBox(
            height: 16,
          ),
          const Spacer()
        ],
      )
    );
  }
}
