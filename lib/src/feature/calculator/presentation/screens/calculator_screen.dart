import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quantum/src/feature/calculator/models/calculator.dart';
import 'package:quantum/ui_kit/chart.dart';
import 'package:quantum/ui_kit/text_field/text_field.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _sumController = TextEditingController();
  final TextEditingController _percentController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  InvestmentCalculation? calculation;
  bool isMonth = true;
  bool isCompounded = false;
  double sum = 0;

  @override
  void dispose() {
    _sumController.dispose();
    _percentController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 54),
        child: Column(
          children: [
            Row(
              children: [
                AppTextField(
                  controller: _sumController,
                  width: MediaQuery.of(context).size.width * 0.45,
                  suffix: const Text(
                    "\$",
                    style: TextStyle(fontSize: 31),
                  ),
                  onChanged: (p0) => setState(() {}),
                  textInputType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
                const Gap(20),
                AppTextField(
                  controller: _percentController,
                  width: MediaQuery.of(context).size.width * 0.35,
                  suffix: const Text(
                    "%",
                    style: TextStyle(fontSize: 31),
                  ),
                  onChanged: (p0) => setState(() {}),
                  textInputType:
                      const TextInputType.numberWithOptions(decimal: true),
                )
              ],
            ),
            const Gap(16),
            Row(
              children: [
                AppTextField(
                  controller: _dateController,
                  width: MediaQuery.of(context).size.width * 0.35,
                  suffix: const Icon(
                    Icons.av_timer,
                    size: 31,
                    color: Colors.white,
                  ),
                  onChanged: (p0) => setState(() {}),
                  textInputType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
                const Gap(20),
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: 38,
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFB5B5B5).withOpacity(0.5),
                            Color(0xFFB5B5B5).withOpacity(0.39),
                          ],
                          stops: const [0.5, 1.0],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 1000),
                        child: SelectedOptionWidget(
                          onPressed: () {
                            setState(() {
                              isMonth = !isMonth;
                            });
                          },
                          isSelected: isMonth,
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Text(
                            'month',
                            key: ValueKey<bool>(isMonth),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: isMonth ? Colors.white : Color(0xFFB4B4B4),
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 1000),
                        child: SelectedOptionWidget(
                          onPressed: () {
                            setState(() {
                              isMonth = !isMonth;
                            });
                          },
                          isSelected: !isMonth,
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Text(
                            'year',
                            key: ValueKey<bool>(!isMonth),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color:
                                  !isMonth ? Colors.white : Color(0xFFB4B4B4),
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Gap(16),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 38,
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFB5B5B5).withOpacity(0.5),
                        Color(0xFFB5B5B5).withOpacity(0.39),
                      ],
                      stops: const [0.5, 1.0],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 1000),
                    child: SelectedOptionWidget(
                      onPressed: () {
                        setState(() {
                          isCompounded = !isCompounded;
                        });
                      },
                      isSelected: isCompounded,
                      width: MediaQuery.of(context).size.width * 0.358,
                      child: Text(
                        'compaunded',
                        key: ValueKey<bool>(isCompounded),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color:
                              isCompounded ? Colors.white : Color(0xFFB4B4B4),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 1000),
                    child: SelectedOptionWidget(
                      onPressed: () {
                        setState(() {
                          isCompounded = !isCompounded;
                        });
                      },
                      isSelected: !isCompounded,
                      width: MediaQuery.of(context).size.width * 0.555,
                      child: Text(
                        'compaundless',
                        key: ValueKey<bool>(!isCompounded),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color:
                              !isCompounded ? Colors.white : Color(0xFFB4B4B4),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Gap(30),
            CupertinoButton(
              onPressed: () {
                setState(() {
                  calculation = InvestmentCalculation(
                    initialAmount: double.parse(_sumController.text),
                    annualRate: double.parse(_percentController.text),
                    duration:
                        int.parse(_dateController.text) * (isMonth ? 1 : 12),
                    isCompounded: isCompounded,
                  );
                  sum = calculation!.calculateMonthlyGrowth().last.amount;
                });
              },
              child: DecoratedBox(
                decoration: ShapeDecoration(
                  color: const Color(0xFF3764F3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(29),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 76, vertical: 18),
                  child: Text(
                    'calculate',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
            const Gap(16),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  const Text('Total amount',
                      style: TextStyle(
                        color: Color(0xFF9E9E9E),
                        fontSize: 18,
                      )),
                  Text(
                    "\$${sum.toStringAsFixed(2)}",
                  ),
                ],
              ),
            ),
            const Gap(16),
            if (sum != 0)
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: CustomPaint(
                        painter: DotGridPainter(),
                      ),
                    ),
                    SfCartesianChart(
                      legend: Legend(isVisible: false),
                      primaryXAxis: CategoryAxis(
                        majorGridLines: const MajorGridLines(width: 0),
                        axisLine: const AxisLine(width: 0),
                        labelRotation: 45,
                        labelStyle:
                            const TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      primaryYAxis: NumericAxis(
                        majorGridLines: const MajorGridLines(width: 0),
                        axisLine: const AxisLine(width: 0),
                        labelStyle:
                            const TextStyle(fontSize: 12, color: Colors.white),
                        title: const AxisTitle(
                            text: ' Amount (\$),',
                            textStyle:
                                TextStyle(fontSize: 14, color: Colors.white)),
                      ),
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: [
                        LineSeries<MonthlyGrowth, int>(
                          dataSource: calculation!.calculateMonthlyGrowth(),
                          xValueMapper: (MonthlyGrowth data, _) => data.month,
                          yValueMapper: (MonthlyGrowth data, _) => data.amount,
                          markerSettings: const MarkerSettings(isVisible: true),
                          name: 'Growth',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class SelectedOptionWidget extends StatelessWidget {
  final Widget child;
  final bool isSelected;
  final double width;
  final VoidCallback? onPressed;
  const SelectedOptionWidget({
    super.key,
    required this.child,
    required this.isSelected,
    required this.width,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(19),
        child: Ink(
          height: 38,
          width: width,
          decoration: isSelected
              ? ShapeDecoration(
                  color: const Color(0xFF3764F3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(19),
                  ),
                )
              : null,
          child: Center(child: child),
        ),
      ),
    );
  }
}
