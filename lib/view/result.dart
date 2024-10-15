import 'package:bmi_calculator/widgets/text.dart';
import 'package:flutter/material.dart';

class DialogResult {
  static void showMyDialog(BuildContext context, double bmiValue) {
    String resultMessage = getBMICategory(bmiValue);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "BMI result",
            style: TextStyle(
              color: Color(0xFF41BEE5),
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min, // O'lchamni belgilash
            children: [
              Count(bmiValue.toStringAsFixed(2)), // BMI qiymatini ko'rsatish
              const SizedBox(height: 8.0), // Bo'shliq
              Text(resultMessage, textAlign: TextAlign.center), // Tavsiyalar
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dialogni yopish
              },
              child: const Text(
                'OK',
                style: TextStyle(
                  color: Color(0xFF41BEE5),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  static String getBMICategory(double bmi) {
    if (bmi < 18.5) {
      return "Underweight: You need to gain some weight.";
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return "Normal: You have a healthy weight.";
    } else if (bmi >= 25 && bmi < 29.9) {
      return "Overweight: You should consider losing some weight.";
    } else {
      return "Obesity: It's important to seek advice on weight management.";
    }
  }
}
