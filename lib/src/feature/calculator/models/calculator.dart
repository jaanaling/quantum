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
List<MonthlyGrowth> calculateMonthlyGrowth() {
  final monthlyRate = annualRate / 100 / 12;
  double amount = initialAmount;
  List<MonthlyGrowth> growth = [];

  for (int month = 1; month <= duration; month++) {
    if (isCompounded) {
      // Сложные проценты
      amount = initialAmount * pow(1 + monthlyRate, month);
    } else {
      // Простые проценты, рассчитываем месячное увеличение
      double simpleGrowth = initialAmount + (initialAmount * monthlyRate * month);
      amount = simpleGrowth;
    }
    growth.add(MonthlyGrowth(month: month, amount: amount));
  }
  return growth;
}

}

class MonthlyGrowth {
  final int month;
  final double amount;

  MonthlyGrowth({required this.month, required this.amount});
}
