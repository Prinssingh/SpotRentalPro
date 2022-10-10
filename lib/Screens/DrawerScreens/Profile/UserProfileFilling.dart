import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spot_buy/DataBase/UserDataBase.dart';
import 'package:spot_buy/Models/UserDataModel.dart';
import 'package:spot_buy/Screens/HomeScreen.dart';
import 'package:spot_buy/Utils/SpotColors.dart';
import 'package:spot_buy/Utils/SpotSharedPref.dart';

class UserProfileFilling extends StatefulWidget {
  const UserProfileFilling({Key? key}) : super(key: key);

  @override
  State<UserProfileFilling> createState() => _UserProfileFillingState();
}

class _UserProfileFillingState extends State<UserProfileFilling> {
  String UserName = "User Name";
  String UserEmail = "xyzmail@gmail.com";
  String genderValue = "Male";
  String Mobile = "+91 ";

  //Text Editing Controllers
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final emailAddress = TextEditingController();
  final address = TextEditingController();



  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBody: true,

      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "User Profile",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: SpotColors.colorPrimary, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          color: SpotColors.colorPrimary,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 25,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: width,
              alignment: Alignment.center,
              child: Column(
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Center(
                      child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: SpotColors.colorProfileBackground,
                        radius: 60,
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          child: Center(
                            child: Image.asset("assets/images/userDefault.png"),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        UserName,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: SpotColors.colorPrimary),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        UserEmail,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: SpotColors.colorGrayLight),
                      ),
                    ],
                  ))
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(24),
              child: Form(
                child: Column(
                  children: [
                    //First Name
                    TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      controller: firstName,
                      keyboardType: TextInputType.name,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      cursorColor: Theme.of(context).cursorColor,
                      decoration: const InputDecoration(
                        labelText: "What's your first name?",
                        labelStyle: TextStyle(
                          color: SpotColors.colorTextField,
                          fontSize: 18,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: SpotColors.colorGrayLight2,
                          ),
                        ),
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Empty';
                        }
                        return null;
                      },
                    ),

                    //LastName
                    TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      controller: lastName,
                      keyboardType: TextInputType.name,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      cursorColor: Theme.of(context).cursorColor,
                      decoration: const InputDecoration(
                        labelText: "And your last name?",
                        labelStyle: TextStyle(
                          color: SpotColors.colorTextField,
                          fontSize: 18,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: SpotColors.colorGrayLight2,
                          ),
                        ),
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Empty';
                        }
                        return null;
                      },
                    ),

                    //Email address
                    TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      controller: emailAddress,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      cursorColor: Theme.of(context).cursorColor,
                      decoration: const InputDecoration(
                        labelText: "Email Address",
                        labelStyle: TextStyle(
                          color: SpotColors.colorTextField,
                          fontSize: 18,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: SpotColors.colorGrayLight2,
                          ),
                        ),
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Empty';
                        } else {
                          text.isValidEmail() ? null : "Invalid Email";
                        }

                        return null;
                      },
                    ),

                    //GENDER dropdown
                    DropdownButton<String>(
                      value: genderValue,
                      isExpanded: true,
                      hint: const Text(
                        "Select your gender?",
                        style: TextStyle(
                          color: SpotColors.colorTextField,
                          fontSize: 18,
                        ),
                      ),
                      items: const <DropdownMenuItem<String>>[
                        DropdownMenuItem(
                          value: 'Male',
                          child: Text('Male'),
                        ),
                        DropdownMenuItem(
                          value: 'Female',
                          child: Text('Female'),
                        ),
                        DropdownMenuItem(
                          value: 'Other',
                          child: Text('Other'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          genderValue = value.toString();
                        });
                      },
                    ),

                    //Address
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: address,
                      keyboardType: TextInputType.name,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      cursorColor: Theme.of(context).cursorColor,
                      decoration: const InputDecoration(
                        labelText: "Where do you live(Your Address)?",
                        labelStyle: TextStyle(
                          color: SpotColors.colorTextField,
                          fontSize: 18,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: SpotColors.colorGrayLight2,
                          ),
                        ),
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Empty';
                        }
                        return null;
                      },

                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    //Update profile button
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 24),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: SpotColors.colorPrimary,
                            shape: const StadiumBorder(),
                            minimumSize: const Size.fromHeight(44),
                            shadowColor: SpotColors.colorPrimary),
                        onPressed: saveUserData,
                        child: const Text(
                          "Update Profile",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool validateEntries() {
    bool isValid = true;
    if (firstName.text.isEmpty) {
      isValid = false;
    } else if (lastName.text.isEmpty) {
      isValid = false;
    } else if (emailAddress.text.isEmpty) {
      isValid = false;
    }
    return isValid;
  }

  //Get Entered Data
  Future<UserDataModel> getEntryData() async{
    Mobile =(await SpotSharedPref.getUserMobile())!;
    return UserDataModel(firstName: firstName.text.toString(),
              lastName: lastName.text.toString(),
              gender: genderValue,
              address: address.text.toString(),
              mobile: Mobile,
              email: emailAddress.text.toString());
  }


  // Save Data
  void saveUserData() async {

    if(validateEntries()){
      var db =UserDataBase();
      db.insert(await getEntryData());
      print("Data Inserted");

      //Set SharedPref new data
      SpotSharedPref.setUserEmail(emailAddress.text.toString());
      SpotSharedPref.setUserName(""+firstName.text.toString()+" "+ lastName.text.toString());

      OpenNextPage();

    }
    else {
      print("Invalid data");
      Fluttertoast.showToast(
          msg: "Invalid Data",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }


  }

  //Page Route

  void OpenNextPage()async{
    SpotSharedPref.setUserLoggedIn(true);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context){
          return const HomeScreen() ;
        }
        ), (Route<dynamic> route) => false);

  }


}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
