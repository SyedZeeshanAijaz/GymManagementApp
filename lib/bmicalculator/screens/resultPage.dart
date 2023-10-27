import 'package:flutter/material.dart';
import 'package:project/bmicalculator/components/constants.dart';
import 'package:project/bmicalculator/components/reusable_card.dart';
import 'package:project/bmicalculator/components/bottombutton.dart';
import 'package:project/bmicalculator/components/Calculator_brain.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ResultPage extends StatelessWidget {
  final CalculateBrain instance;
  const ResultPage({required this.instance});
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
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'BMI CALCULATOR',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 50, left: 15),
                child: Text(
                  'Your Result',
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      instance.getResult(),
                      style: kResultTextStyle,
                    ),
                    CircularPercentIndicator(
                      animation: true,
                      animationDuration: 800,
                      radius: 150,
                      lineWidth: 20,
                      progressColor: Colors.teal.shade700,
                      backgroundColor: Colors.teal.shade100,
                      percent: instance.calculateBMIAsDouble() / 50,
                      circularStrokeCap: CircularStrokeCap.round,
                      center: Text(instance.calculateBMI().toString(),
                          style: kBMITextStyle),
                    ),
                    Text(
                      instance.getInterpretation(),
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
              str1: 'RE-CALCULATE',
              onPress: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
