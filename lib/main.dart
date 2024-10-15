import 'package:bmi_calculator/view/home_page.dart';
import 'package:bmi_calculator/view/splash.dart';
import 'package:bmi_calculator/view_model/viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterViewModel()), // ViewModelni provider orqali bog'lash
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Center(
          child: SplashScreen(),
        ),
      ),
    );
  }
}





