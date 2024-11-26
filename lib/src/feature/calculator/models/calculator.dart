import 'dart:math';

class InvestmentCalculation {
  final double initialAmount;
  final double annualRate;
  final int duration;
  final bool isCompounded;

  InvestmentCalculation({
    required this.initialAmount,
    required this.annualRate,
    required this.duration,
    this.isCompounded = false,
  });

  double calculateFinalAmount() {
    if (isCompounded) {
      final rate = annualRate / 100;
      return initialAmount * pow(1 + rate, duration);
    } else {
      final simpleInterest = initialAmount * (annualRate / 100) * duration;
      return initialAmount + simpleInterest;
    }
  }
}
