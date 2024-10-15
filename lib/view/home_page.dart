import 'package:bmi_calculator/test.dart';
import 'package:bmi_calculator/view/result.dart';
import 'package:bmi_calculator/view_model/viewmodel.dart';
import 'package:bmi_calculator/widgets/button.dart';
import 'package:bmi_calculator/widgets/container.dart';
import 'package:bmi_calculator/widgets/decoration.dart';
import 'package:bmi_calculator/widgets/gender_selection.dart';
import 'package:bmi_calculator/widgets/slider.dart';
import 'package:bmi_calculator/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender? _gender; // Gender qiymatini nullable qilib belgilash
  double _sliderValue = 20.0;

  @override
  Widget build(BuildContext context) {
    final counterViewModel = Provider.of<CounterViewModel>(context);
    return Scaffold(
      backgroundColor: Color(0xFFF0F0F3),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "BMI Calculator",
          style: TextStyle(
            color: Color(0xFF41BEE5),
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: GenderSelection(
                onGenderSelected: (gender) {
                  setState(() {
                    _gender = gender;
                  });
                },
              ),
            ),
            Expanded(
              flex: 5,
              child: Row(
                children: [
                  // Slider uchun container
                  Expanded(
                    flex: 1,
                    child: BlocContainer(
                      Padding(
                        padding: const EdgeInsets.all(36.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "age",
                              style: TextStyle(
                                color: Color(0xFF7C7C7C),
                                fontSize: 24,
                              ),
                            ),
                            Expanded(
                              child: VerticalSlider(
                                sliderValue: _sliderValue,
                                onChanged: (newValue) {
                                  setState(() {
                                    _sliderValue = newValue;
                                  });
                                },
                              ),
                            ),
                            Text(
                              _sliderValue.toInt().toString(),
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 24.0),
                  // Vazn va yosh uchun qator
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Expanded(
                          child: BlocContainer(
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TypeText("weight"),
                                Count(counterViewModel.weight.toString()),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          counterViewModel.decrementWeight();
                                        },
                                        child: ButtonDesign(Icons.remove)),
                                    GestureDetector(
                                        onTap: () {
                                          counterViewModel.incrementWeight();
                                        },
                                        child: ButtonDesign(Icons.add)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Expanded(
                          child: BlocContainer(
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TypeText("height"),
                                Count(counterViewModel.height.toString()),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          counterViewModel.decrementHeight();
                                        },
                                        child: ButtonDesign(Icons.remove)),
                                    GestureDetector(
                                        onTap: (){
                                          counterViewModel.incrementHeight();
                                        },
                                        child: ButtonDesign(Icons.add)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24.0),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: GestureDetector(
                onTap: () {
                  if (_gender == null) {
                    // Agar gender tanlanmagan bo'lsa, xabar ko'rsatish
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please select a gender")),
                    );
                  } else {
                    DialogResult.showMyDialog(
                      context,
                      counterViewModel.bmi, // BMI qiymati
                    );
                  }
                },
                child: Container(
                  decoration: DecorationBlue(),
                  child: const Center(
                    child: Text(
                      "calculation",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
