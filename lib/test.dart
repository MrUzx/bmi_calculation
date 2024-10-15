import 'package:flutter/material.dart';
import 'dart:math';

class BMIGauge extends StatefulWidget {
  final double bmiValue;

  BMIGauge({required this.bmiValue});

  @override
  _BMIGaugeState createState() => _BMIGaugeState();
}

class _BMIGaugeState extends State<BMIGauge> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Gauge Background
        CustomPaint(
          size: Size(200, 200),
          painter: GaugePainter(),
        ),
        // Rotating needle
        Transform.rotate(
          angle: _bmiToAngle(widget.bmiValue), // Convert BMI to angle
          child: Container(
            width: 10,
            height: 100,
            color: Colors.black,
          ),
        ),
        Positioned(
          bottom: 20,
          child: Text(
            'BMI: ${widget.bmiValue.toStringAsFixed(1)}',
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    );
  }

  // Converts BMI value to an angle for the needle
  double _bmiToAngle(double bmi) {
    const minBMI = 15.0;
    const maxBMI = 40.0;
    const minAngle = -pi / 2; // -90 degrees
    const maxAngle = pi / 2;  // 90 degrees

    // Clamp BMI value to the range
    bmi = bmi.clamp(minBMI, maxBMI);

    // Map BMI to angle
    return (bmi - minBMI) / (maxBMI - minBMI) * (maxAngle - minAngle) + minAngle;
  }
}

class GaugePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Draw the gauge arc
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    // Draw different colored sections
    paint.color = Colors.green;
    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: 100),
      -pi / 2, // Start from -90 degrees
      pi / 6,  // 30 degrees for green
      false,
      paint,
    );

    paint.color = Colors.yellow;
    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: 100),
      -pi / 6, // Start after green
      pi / 6,  // 30 degrees for yellow
      false,
      paint,
    );

    paint.color = Colors.orange;
    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: 100),
      0,
      pi / 6, // 30 degrees for orange
      false,
      paint,
    );

    paint.color = Colors.red;
    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: 100),
      pi / 6,
      pi / 6, // 30 degrees for red
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
