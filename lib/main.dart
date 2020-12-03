import 'package:flutter/material.dart';
import 'package:know_bmi/gender_selection.dart';

void main() => runApp(KnowBmiApp());

class KnowBmiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xff16171B),
      ),
      home: GenderSelectionPage(),
    );
  }
}
