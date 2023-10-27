import 'dart:math';

class CalculateBrain {
  CalculateBrain({this.weight, this.height});
  final int? weight;
  final int? height;
  late double _bmi;
  String? calculateBMI() {
    _bmi = weight! / pow(height! / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  double calculateBMIAsDouble() {
    _bmi = weight! / pow(height! / 100, 2);
    return _bmi;
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have higher than normal BMI.';
    } else if (_bmi >= 18.5) {
      return 'You have normal weight. Good Job!';
    } else {
      return 'You have lower than normal weight.';
    }
  }
}
