import 'package:bmi_calculator/model/counter_model.dart';
import 'package:flutter/material.dart';

class CounterViewModel extends ChangeNotifier {
  CounterModel _counterModel = CounterModel(weight: 70, height: 170); // Boshlang'ich qiymatlar

  // Modeldan weight qiymatini olish
  int get weight => _counterModel.weight;

  // Modeldan height qiymatini olish
  int get height => _counterModel.height;

  // BMI hisoblash
  double get bmi => _calculateBMI();

  // Weight qiymatini oshirish
  void incrementWeight() {
    _counterModel.weight++;
    notifyListeners();  // UI-ni yangilash
  }

  // Weight qiymatini kamaytirish
  void decrementWeight() {
    _counterModel.weight--;
    notifyListeners();  // UI-ni yangilash
  }

  // Height qiymatini oshirish
  void incrementHeight() {
    _counterModel.height++;
    notifyListeners();  // UI-ni yangilash
  }

  // Height qiymatini kamaytirish
  void decrementHeight() {
    _counterModel.height--;
    notifyListeners();  // UI-ni yangilash
  }

  // BMI hisoblash funksiyasi
  double _calculateBMI() {
    if (_counterModel.height <= 0) return 0.0; // 0 dan past bo'lishiga yo'l qo'ymaslik
    return _counterModel.weight / ((height / 100) * (height / 100)); // Bo'yni metrga o'tkazish
  }
}
