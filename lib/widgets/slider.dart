import 'package:flutter/material.dart';

class VerticalSlider extends StatefulWidget {
  final double sliderValue;
  final ValueChanged<double> onChanged;

  const VerticalSlider({Key? key, required this.sliderValue, required this.onChanged}) : super(key: key);

  @override
  _VerticalSliderState createState() => _VerticalSliderState();
}

class _VerticalSliderState extends State<VerticalSlider> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RotatedBox(
        quarterTurns: 3, // Slayderni vertikal qilish uchun
        child: SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Color(0xFF41BEE5), // Faol chiziq rangi
            inactiveTrackColor: Color(0xFFD5E1E5), // Noaktiv chiziq rangi
            thumbColor: Colors.blue, // Thumb rangi
            overlayColor: Colors.blue.withOpacity(0.2), // Thumb atrofidagi effekt
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0), // Thumb shakli
            trackHeight: 20.0, // Chiziq qalinligi
          ),
          child: Slider(
            value: widget.sliderValue,
            min: 7,
            max: 71,
            onChanged: widget.onChanged,
          ),
        ),
      ),
    );
  }
}
