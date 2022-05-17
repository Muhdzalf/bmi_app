import 'package:bmi_app/result_page.dart';
import 'package:bmi_app/themes/colors.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Aplikasi BMI',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: mainColor,
            appBarTheme: AppBarTheme(backgroundColor: mainColor)),
        home: const HomePage());
  }
}
