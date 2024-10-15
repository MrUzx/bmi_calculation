import 'package:bmi_calculator/test.dart';
import 'package:bmi_calculator/widgets/container.dart';
import 'package:flutter/material.dart';

import 'decoration.dart';

enum Gender { male, female }

class GenderSelection extends StatefulWidget {
  final ValueChanged<Gender?> onGenderSelected;

  const GenderSelection({Key? key, required this.onGenderSelected})
      : super(key: key);

  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  Gender? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Erkak tugmasi
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedGender = Gender.male;
                  widget.onGenderSelected(_selectedGender);
                });
              },
              child: Container(
                height: double.maxFinite,
                decoration: _selectedGender == Gender.male
                    ? DecorationBlue()
                    : DecorationWhite(),
                child: Icon(
                  size: 44,
                  Icons.male,
                  color: _selectedGender == Gender.male
                      ? Colors.white
                      : Colors.black87,
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
          // Ayol tugmasi
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedGender = Gender.female;
                  widget.onGenderSelected(_selectedGender);
                });
              },
              child: Container(
                height: double.maxFinite,
                decoration: _selectedGender == Gender.female
                    ? DecorationBlue()
                    : DecorationWhite(),
                child: Icon(
                  size: 44,
                  Icons.female,
                  color: _selectedGender == Gender.female
                      ? Colors.white
                      : Colors.black87,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
