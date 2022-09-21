 import 'package:flutter/material.dart';
import 'package:spot_buy/Screens/Login.dart';
import 'package:spot_buy/Utils/SpotColors.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(4, 62, 4, 4),
          child: const Text(
            "Choose the language ",
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: SpotColors.colorPrimary,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            mainAxisSpacing: 8.0,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: List.generate(LanguageOptions.length, (index) {
              return Center(
                child: LanguageCard(languageItem: LanguageOptions[index]),
              );
            }),
          ),
        ),
      ],
    ));
  }
}

class LanguageItem {
  const LanguageItem(this.name, this.language);

  final String name;
  final String language;
}

// ignore: non_constant_identifier_names
List<LanguageItem> LanguageOptions = const <LanguageItem>[
  LanguageItem("English", "English"),
  LanguageItem("Hindi", "हिन्दी"),
  LanguageItem("Bengali", "বাংলা"),
  LanguageItem("Marathi", "मराठी"),
  LanguageItem("Tamil", "தமிழ்"),
  LanguageItem("Telugu", "తెలుగు"),
  LanguageItem("Punjabi", "ਪੰਜਾਬੀ"),
  LanguageItem("Telugu", "తెలుగు"),
  LanguageItem("Punjabi", "ਪੰਜਾਬੀ"),
  LanguageItem("Others", ""),
];

class LanguageCard extends StatelessWidget {
  final LanguageItem languageItem;

  const LanguageCard({Key? key, required this.languageItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return InkWell(
      onTap: () {
        print("Clicked to "+languageItem.name);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context){
              return  Login();
            }
            ), (Route<dynamic> route) => false);
      },
      child: Card(
          elevation: 4,
          color: SpotColors.colorGrayLight,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(languageItem.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: SpotColors.colorPrimary)),
                Text("( " + languageItem.language + " )",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black))
              ],
            ),
          )


      ),
    );

  }
}
