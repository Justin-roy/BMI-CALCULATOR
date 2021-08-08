import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reuable_container.dart';
import 'custom_icons.dart';
import 'results_page.dart';
import 'const_colors.dart';
import 'calculation_brain.dart';

enum Gender { male, female, transgender }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.transgender;
  int height = 180;
  int weight = 59;
  int age = 19;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI CALCULATOR"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReusableContainer(
                      custom_color: selectedGender == Gender.male
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChld: CustomIcons(
                        icon: FontAwesomeIcons.mars,
                        label: "Male",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReusableContainer(
                      cardChld: CustomIcons(
                        icon: FontAwesomeIcons.venus,
                        label: "Female",
                      ),
                      custom_color: selectedGender == Gender.female
                          ? activeCardColor
                          : inactiveCardColor,
                    ),
                  ),
                ),
              ],
            )),
            Expanded(
              child: ReusableContainer(
                cardChld: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Height",
                      style: customTextStyle2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: customTextStyle,
                        ),
                        Text(
                          "cm",
                          style: customTextStyle2,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: Color(0xFFEB1555),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                        overlayColor: Color(0x55EB1555),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                custom_color: activeCardColor,
              ),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableContainer(
                    cardChld: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Weight",
                          style: customTextStyle2,
                        ),
                        Text(
                          weight.toString(),
                          style: customTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: 'btn_3',
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  weight = weight - 1;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            FloatingActionButton(
                              heroTag: 'btn_4',
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  weight = weight + 1;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    custom_color: activeCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableContainer(
                    cardChld: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Age",
                          style: customTextStyle2,
                        ),
                        Text(
                          age.toString(),
                          style: customTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: 'btn_1',
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  age = age - 1;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            FloatingActionButton(
                              heroTag: 'btn_2',
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  age = age + 1;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    custom_color: activeCardColor,
                  ),
                ),
              ],
            )),
            GestureDetector(
              onTap: () {
                CalculationBrain calc =
                    CalculationBrain(weight: weight, height: height);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                            bmiResults: calc.calculate(),
                            testResults: calc.getResults(),
                            feedBack: calc.getFeedBack(),
                          )),
                );
              },
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "CALCULATE",
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
        ));
  }
}
