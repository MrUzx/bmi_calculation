import 'package:bmi_calculator/view/home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Orqa fon rangi
      body: Stack(
        children: [
          // Sizning logotipingiz
          Center(
            child: Image.asset(
              'assets/logo.png', // Logotip joyi (o'zgartiring)
              height: 300, // Logotip balandligi
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 20,
            child: const Text(
              "by SevenOne",
              textAlign: TextAlign.center, // Matnni markazga joylashtirish
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
