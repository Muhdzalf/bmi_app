import 'dart:math';

import 'package:flutter/material.dart';

import 'result_page.dart';
import 'themes/colors.dart';

enum Gender { male, female }

Gender? selectedGender;
int height = 120;
int weight = 50;
int age = 18;

double _bmi = 0.0;

String calculateBMI() {
  _bmi = weight / pow(height / 100, 2);
  return _bmi.toStringAsFixed(1);
}

String getResult() {
  if (_bmi >= 25) {
    return "Overweight";
  } else if (_bmi > 18.5) {
    return "Normal";
  } else {
    return "Underweight";
  }
}

String getInterpretation() {
  if (_bmi >= 25) {
    return "You have a higher than normal body weight. Try to exercise more.";
  } else if (_bmi > 18.5) {
    return "You have a normal body weight. Good job!";
  } else {
    return "You have a lower than normal body weight. You can eat a bit more.";
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
        centerTitle: true,
        leading: const Icon(Icons.menu),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    press: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? activeColor
                        : thirdColor,
                    cardContent: IconContent(
                      text: "Male",
                      icon: Icons.male,
                    ),
                  ),
                ),
                Expanded(
                    child: ReusableCard(
                  press: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  color: selectedGender == Gender.female
                      ? activeColor
                      : thirdColor,
                  cardContent: IconContent(icon: Icons.female, text: "Female"),
                )),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: thirdColor,
              cardContent: const HeightContent(),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                        color: thirdColor, cardContent: const WeightContent())),
                Expanded(
                    child: ReusableCard(
                        color: thirdColor, cardContent: const AgeContent())),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      result: getResult(),
                      interpretation: getInterpretation(),
                      bmi: calculateBMI(),
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  primary: secondaryColor,
                  fixedSize: const Size.fromHeight(50)),
              child: const Text(
                "CALCULATE YOUR BMI",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ))
        ],
      ),
    );
  }
}

class WeightContent extends StatefulWidget {
  const WeightContent({
    Key? key,
  }) : super(key: key);

  @override
  State<WeightContent> createState() => _WeightContentState();
}

class _WeightContentState extends State<WeightContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "WEIGHT",
          style: TextStyle(
              fontSize: 18, color: textColor, fontWeight: FontWeight.w500),
        ),
        Text(
          weight.toString(),
          style: TextStyle(
              color: whiteColor, fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  weight++;
                });
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: secondaryColor),
                child: Center(
                  child: Icon(
                    Icons.add,
                    color: whiteColor,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  weight--;
                });
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: secondaryColor),
                child: Center(
                  child: Icon(
                    Icons.remove,
                    color: whiteColor,
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

class AgeContent extends StatefulWidget {
  const AgeContent({
    Key? key,
  }) : super(key: key);

  @override
  State<AgeContent> createState() => _AgeContentState();
}

class _AgeContentState extends State<AgeContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "Age",
          style: TextStyle(
              fontSize: 18, color: textColor, fontWeight: FontWeight.w500),
        ),
        Text(
          age.toString(),
          style: TextStyle(
              color: whiteColor, fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  age++;
                });
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: secondaryColor),
                child: Center(
                  child: Icon(
                    Icons.add,
                    color: whiteColor,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  age--;
                });
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: secondaryColor),
                child: Center(
                  child: Icon(
                    Icons.remove,
                    color: whiteColor,
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

class HeightContent extends StatefulWidget {
  const HeightContent({
    Key? key,
  }) : super(key: key);

  @override
  State<HeightContent> createState() => _HeightContentState();
}

class _HeightContentState extends State<HeightContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        Text(
          "HEIGHT",
          style: TextStyle(
              fontSize: 18, color: textColor, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 12,
        ),
        RichText(
          text: TextSpan(
            text: height.toString(),
            style: TextStyle(
                fontSize: 32, fontWeight: FontWeight.w500, color: whiteColor),
            children: [
              TextSpan(
                  text: "cm", style: TextStyle(fontSize: 16, color: textColor))
            ],
          ),
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
              inactiveTrackColor: grayColor,
              activeTrackColor: whiteColor,
              thumbColor: secondaryColor,
              // overlayColor: secondaryColor.withOpacity(0.8),
              rangeThumbShape:
                  const RoundRangeSliderThumbShape(enabledThumbRadius: 15),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 30)),
          child: Slider(
            value: height.toDouble(),
            onChanged: (newValue) {
              setState(() {
                height = newValue.round();
              });
            },
            min: 100,
            max: 250,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Widget? cardContent;
  final Function()? press;
  final Color color;
  ReusableCard({required this.cardContent, this.press, required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: cardContent),
    );
  }
}

class IconContent extends StatelessWidget {
  final String text;
  final IconData icon;

  IconContent({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: whiteColor,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.w500, fontSize: 18),
        )
      ],
    );
  }
}
