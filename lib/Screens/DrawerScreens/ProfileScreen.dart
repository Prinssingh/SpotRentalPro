import 'package:flutter/material.dart';
import 'package:spot_buy/Screens/Widgets/InfoCard.dart';

//Data
const url = "meshivanshsingh.me";
const email = "me.shivansh007@gmail.com";
const phone = "90441539202"; // not real number :)
const location = "Lucknow, India";

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[800],
        body: SafeArea(
          minimum: const EdgeInsets.only(top: 100),
          child: Column(
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/avatar.jpg'),
              ),
              Text(
                "Shubham Singh",
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Pacifico",
                ),
              ),
              Text(
                "Spot Buy",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.blueGrey[200],
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Source Sans Pro"),
              ),
              SizedBox(
                height: 20,
                width: 200,
                child: Divider(
                  color: Colors.white,
                ),
              ),

              // we will be creating a new widget name info carrd

              InfoCard(text: phone, icon: Icons.phone, onPressed: () async {}),
              InfoCard(text: url, icon: Icons.web, onPressed: () async {}),
              InfoCard(
                  text: location,
                  icon: Icons.location_city,
                  onPressed: () async {}),
              InfoCard(text: email, icon: Icons.email, onPressed: () async {}),
            ],
          ),
        ));
  }
}
