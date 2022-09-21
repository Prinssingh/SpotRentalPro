import 'package:flutter/material.dart';
import 'package:spot_buy/Utils/SpotColors.dart';

class SpotDrawerHeader extends StatefulWidget {
  const SpotDrawerHeader({Key? key}) : super(key: key);

  @override
  _SpotDrawerHeaderState createState() => _SpotDrawerHeaderState();
}

class _SpotDrawerHeaderState extends State<SpotDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: SpotColors.colorPrimary,
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/logo.png'),
              ),
            ),
          ),
          Text(
            "Rajan",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            "rajankky908@gmail.com",
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}