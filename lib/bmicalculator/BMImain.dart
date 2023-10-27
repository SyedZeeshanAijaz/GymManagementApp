import 'package:flutter/material.dart';
import 'package:project/bmicalculator/screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey[900],
        appBarTheme: AppBarTheme(
          color: Colors.grey[900],
          elevation: 12,
        ),
      ),
      home: InputPage(),
    );
  }
}
