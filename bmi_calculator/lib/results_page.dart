import 'package:bmi_calculator/reuable_container.dart';
import 'package:flutter/material.dart';
import 'reuable_container.dart';
import 'const_colors.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {required this.bmiResults,
      required this.testResults,
      required this.feedBack});
  final String bmiResults;
  final String testResults;
  final String feedBack;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Your Result",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50.0,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableContainer(
              custom_color: activeCardColor,
              cardChld: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    testResults.toUpperCase(),
                    style: TextStyle(
                      color: Color(0xFF24D876),
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    bmiResults,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 100,
                    ),
                  ),
                  Text(
                    feedBack,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "RE - CALCULATE",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              color: bottomCardColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainHeight,
            ),
          ),
        ],
      ),
    );
  }
}
