import 'package:bmi_calculator/bmiCalculatorScreen.dart';
import 'package:bmi_calculator/resultScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:BmiCalculatorScreen() ,
    );
  }
}

