import 'dart:math';

class CalculationBrain {
  CalculationBrain({required this.weight, required this.height});
  final int weight;
  final int height;
  late double _bmi;
  String calculate() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResults() {
    if (_bmi == 30)
      return "Obesity";
    else if (_bmi >= 25)
      return "Overweight";
    else if (_bmi >= 18.5)
      return "Normal";
    else
      return "Underweight";
  }

  String getFeedBack() {
    if (_bmi == 30)
      return "You have a higher than Overweight body weight. Try to exercise more and more.";
    else if (_bmi >= 25)
      return "You have a higher than normal body weight. Try to exercise more.";
    else if (_bmi >= 18.5)
      return "You have a Normal body weight. Good Job!";
    else
      return "You have a lower than normal body weight. You can eat a bit more.";
  }
}
