import 'package:bmi_app/themes/colors.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key, this.result, this.bmi, this.interpretation})
      : super(key: key);

  final String? result;
  final String? bmi;
  final String? interpretation;

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
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              "Your Result",
              style: TextStyle(
                  fontSize: 40, fontWeight: FontWeight.w500, color: whiteColor),
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: thirdColor,
              cardContent: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    result!,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: result! == "Normal" ? Colors.green : Colors.red),
                  ),
                  Text(
                    bmi!,
                    style: TextStyle(
                        fontSize: 84,
                        fontWeight: FontWeight.w500,
                        color: whiteColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      interpretation!,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: whiteColor),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  primary: secondaryColor,
                  fixedSize: const Size.fromHeight(50)),
              child: const Text(
                "RE-CALCULATE YOUR BMI",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ))
        ],
      ),
    );
  }
}
