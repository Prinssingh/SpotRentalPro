import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      extendBody: true,

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(

          children: [
            Card(),

          ],
        ),
      ),

    );

  }
}
