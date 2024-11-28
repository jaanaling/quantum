import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:printing/printing.dart';
import 'package:quantum/src/feature/balance/bloc/balance_bloc.dart';
import 'package:quantum/src/feature/balance/models/history.dart';
import 'package:quantum/src/feature/balance/models/portfolio.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';

class HistoryChart extends StatefulWidget {
  final List<History> history;

  const HistoryChart({Key? key, required this.history}) : super(key: key);

  @override
  _HistoryChartState createState() => _HistoryChartState();
}

class _HistoryChartState extends State<HistoryChart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History of ${widget.history.first.asset.name}'),
      ),
      body: SfCartesianChart(
        primaryXAxis: const DateTimeAxis(),
        primaryYAxis: const NumericAxis(
          title: AxisTitle(text: 'Price'),
        ),
        title: const ChartTitle(text: 'Price History'),
        legend: const Legend(isVisible: false),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: [
          LineSeries<History, DateTime>(
            dataSource: widget.history,
            xValueMapper: (History history, _) => history.date,
            yValueMapper: (History history, _) => history.asset.currentPrice,
            name: 'Price',
            color: Colors.blue,
            markerSettings: const MarkerSettings(isVisible: true),
          ),
        ],
      ),
    );
  }
}

class AssetChart extends StatefulWidget {
  @override
  _AssetChartState createState() => _AssetChartState();
}

class _AssetChartState extends State<AssetChart> {
  String selectedMode = 'Day';
  late List<History> chartData;

  @override
  void initState() {
    super.initState();
    chartData = _generateChartData(selectedMode);
  }

  void _updateChartData(String mode) {
    setState(() {
      selectedMode = mode;
      chartData = _generateChartData(mode);
    });
  }

  List<History> _generateChartData(String mode) {
    final state = context.read<BalanceBloc>().state;
    if (state is BalanceLoaded) {
      DateTime now = DateTime.now();
      switch (mode) {
        case 'Day':
          DateTime startOfDay = DateTime(now.year, now.month, now.day);
          DateTime endOfDay = startOfDay.add(const Duration(days: 1));
          return state.history
              .where((history) =>
                  history.date.isAfter(startOfDay) &&
                  history.date.isBefore(endOfDay))
              .toList();
        case 'Week':
          DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
          DateTime startOfWeekDate =
              DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day);
          DateTime endOfWeek = startOfWeekDate.add(const Duration(days: 7));
          return state.history
              .where((history) =>
                  history.date.isAfter(startOfWeekDate) &&
                  history.date.isBefore(endOfWeek))
              .toList();
        case 'Month':
          DateTime startOfMonth = DateTime(now.year, now.month, 1);
          DateTime endOfMonth = DateTime(now.year, now.month + 1, 1)
              .subtract(const Duration(seconds: 1));
          return state.history
              .where((history) =>
                  history.date.isAfter(startOfMonth) &&
                  history.date.isBefore(endOfMonth))
              .toList();
        case 'Year':
          DateTime startOfYear = DateTime(now.year, 1, 1);
          DateTime endOfYear =
              DateTime(now.year + 1, 1, 1).subtract(const Duration(seconds: 1));
          return state.history
              .where((history) =>
                  history.date.isAfter(startOfYear) &&
                  history.date.isBefore(endOfYear))
              .toList();
        default:
          return [];
      }
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BalanceBloc, BalanceState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                dayButton('Day', () {
                  _updateChartData('Day');
                }),
                const SizedBox(width: 8),
                dayButton('Week', () {
                  _updateChartData('Week');
                }),
                const SizedBox(width: 8),
                dayButton('Month', () {
                  _updateChartData('Month');
                }),
                const SizedBox(width: 8),
                dayButton('Year', () {
                  _updateChartData('Year');
                }),
              ],
            ),
            const SizedBox(height: 16),
            if (state is BalanceLoading)
              const Center(
                child: CircularProgressIndicator(),
              ),
            if (state is BalanceError)
              const Center(
                child: Text('Error'),
              ),
            if (state is BalanceLoaded)
              Expanded(
                child: chartData.isEmpty
                    ? const Center(
                        child: Text(
                          'No data available',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      )
                    : Stack(
                        children: [
                          Positioned.fill(
                            child: CustomPaint(
                              painter: DotGridPainter(),
                            ),
                          ),
                          SfCartesianChart(
                            plotAreaBorderWidth: 0,
                            primaryXAxis: const CategoryAxis(
                              majorGridLines: const MajorGridLines(width: 0),
                              axisLine: const AxisLine(width: 0),
                              labelRotation: 45,
                              labelStyle: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            primaryYAxis: NumericAxis(
                              majorGridLines: const MajorGridLines(width: 0),
                              minorGridLines: MinorGridLines(
                                width: 2,
                                color: Colors.grey,
                              ),
                              axisLine: const AxisLine(width: 0),
                              labelStyle: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                              title: AxisTitle(
                                  text: 'Balance',
                                  textStyle: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  )),
                            ),
                            tooltipBehavior: TooltipBehavior(enable: true),
                            series: [
                              AreaSeries<History, String>(
                                dataSource: chartData,
                                xValueMapper: (History data, _) => selectedMode ==
                                        'Day'
                                    ? "${data.date.hour}:${data.date.minute.toString().padLeft(2, '0')}"
                                    : "${data.date.day}/${data.date.month}",
                                yValueMapper: (History data, _) => data.balance,
                                color: Colors.blue,
                                markerSettings: const MarkerSettings(
                                  isVisible: true,
                                  shape: DataMarkerType.circle,
                                ),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.white.withOpacity(0.4),
                                    Colors.transparent,
                                  ],
                                  stops: const [0.2, 1.0],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                borderColor: Colors.white,
                                borderWidth: 2,
                                opacity: 0.7,
                              ),
                            ],
                          ),
                        ],
                      ),
              ),
          ],
        );
      },
    );
  }

  Widget dayButton(String text, Function() func) {
    return CupertinoButton(
      onPressed: func,
      padding: EdgeInsets.zero,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: selectedMode == text
              ? const Color(0xFF3764F3)
              : const Color(0xAA1F1F1F),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Text(
            text,
            style: TextStyle(
              color:
                  selectedMode == text ? Colors.white : const Color(0xFFB4B4B4),
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

class DotGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.withOpacity(0.4)
      ..style = PaintingStyle.fill;

    const double spacing = 20.0; // Расстояние между точками
    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), 2, paint); // Рисуем круг
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // Фон статичный, нет необходимости перерисовывать
  }
}

class AssetsChart extends StatefulWidget {
  @override
  _AssetsChartState createState() => _AssetsChartState();
}

class _AssetsChartState extends State<AssetsChart> {
  String selectedMode = 'Day';
  late List<History> chartData;
  final GlobalKey _chartKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    chartData = _generateChartData(selectedMode);
  }

  void _updateChartData(String mode) {
    setState(() {
      selectedMode = mode;
      chartData = _generateChartData(mode);
    });
  }

  Future<void> _exportChartToPdf() async {
    try {
      final boundary = _chartKey.currentContext?.findRenderObject()
          as RenderRepaintBoundary?;
      if (boundary == null) {
        throw Exception('Render boundary not found');
      }
      final image = await boundary.toImage(pixelRatio: 3.0);
      final byteData = await image.toByteData(format: ImageByteFormat.png);
      final pngBytes = byteData?.buffer.asUint8List();

      if (pngBytes != null) {
        final pdf = pw.Document();
        final imageProvider = pw.MemoryImage(pngBytes);

        pdf.addPage(
          pw.Page(
            build: (pw.Context context) => pw.Center(
              child: pw.Image(imageProvider),
            ),
          ),
        );

        await Printing.layoutPdf(
          onLayout: (PdfPageFormat format) async => pdf.save(),
        );
      }
    } catch (e) {
      print('Error exporting chart: $e');
    }
  }

  List<History> _generateChartData(String mode) {
    final state = context.read<BalanceBloc>().state;
    if (state is BalanceLoaded) {
      DateTime now = DateTime.now();
      switch (mode) {
        case 'Day':
          DateTime startOfDay = DateTime(now.year, now.month, now.day);
          DateTime endOfDay = startOfDay.add(const Duration(days: 1));
          return state.history
              .where((history) =>
                  history.date.isAfter(startOfDay) &&
                  history.date.isBefore(endOfDay))
              .toList();
        case 'Week':
          DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
          DateTime startOfWeekDate =
              DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day);
          DateTime endOfWeek = startOfWeekDate.add(const Duration(days: 7));
          return state.history
              .where((history) =>
                  history.date.isAfter(startOfWeekDate) &&
                  history.date.isBefore(endOfWeek))
              .toList();
        case 'Month':
          DateTime startOfMonth = DateTime(now.year, now.month, 1);
          DateTime endOfMonth = DateTime(now.year, now.month + 1, 1)
              .subtract(const Duration(seconds: 1));
          return state.history
              .where((history) =>
                  history.date.isAfter(startOfMonth) &&
                  history.date.isBefore(endOfMonth))
              .toList();
        case 'Year':
          DateTime startOfYear = DateTime(now.year, 1, 1);
          DateTime endOfYear =
              DateTime(now.year + 1, 1, 1).subtract(const Duration(seconds: 1));
          return state.history
              .where((history) =>
                  history.date.isAfter(startOfYear) &&
                  history.date.isBefore(endOfYear))
              .toList();
        default:
          return [];
      }
    } else {
      return [];
    }
  }

  List<LineSeries<History, String>> _generateSeries() {
    final groupedData = _groupByAssets(chartData);
    return groupedData.entries.map((entry) {
      final assetName = entry.value.first.asset.name;
      final assetColor = _getColorForAsset(entry.key);

      return LineSeries<History, String>(
        name: assetName,
        dataSource: entry.value,
        xValueMapper: (History data, _) => selectedMode == 'Day'
            ? "${data.date.hour}:${data.date.minute.toString().padLeft(2, '0')}"
            : "${data.date.day}/${data.date.month}",
        yValueMapper: (History data, _) => data.balance,
        color: assetColor,
        markerSettings:
            const MarkerSettings(isVisible: true, shape: DataMarkerType.circle),
      );
    }).toList();
  }

  Map<String, List<History>> _groupByAssets(List<History> history) {
    final Map<String, List<History>> groupedData = {};
    for (var entry in history) {
      final assetId = entry.asset.id;
      if (!groupedData.containsKey(assetId)) {
        groupedData[assetId] = [];
      }
      groupedData[assetId]!.add(entry);
    }
    return groupedData;
  }

  Color _getColorForAsset(String assetId) {
    final colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.red,
      Colors.yellow,
    ];
    final index = assetId.hashCode % colors.length;
    return colors[index];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            dayButton('Day', () {
              _updateChartData('Day');
            }),
            const SizedBox(width: 8),
            dayButton('Week', () {
              _updateChartData('Week');
            }),
            const SizedBox(width: 8),
            dayButton('Month', () {
              _updateChartData('Month');
            }),
            const SizedBox(width: 8),
            dayButton('Year', () {
              _updateChartData('Year');
            }),
            IconButton(
              onPressed: _exportChartToPdf,
              icon: Icon(Icons.picture_as_pdf),
              color: Colors.white,
              iconSize: 36,
            )
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
          child: Stack(
            children: [
              Positioned.fill(
                child: CustomPaint(
                  painter: DotGridPainter(),
                ),
              ),
              RepaintBoundary(
                key: _chartKey,
                child: SfCartesianChart(
                  plotAreaBorderWidth: 0,
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
                        text: 'Balance',
                        textStyle:
                            TextStyle(fontSize: 14, color: Colors.white)),
                  ),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  legend: Legend(isVisible: true),
                  series: _generateSeries(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget dayButton(String text, Function() func) {
    return CupertinoButton(
      onPressed: func,
      padding: EdgeInsets.zero,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: selectedMode == text
              ? const Color(0xFF3764F3)
              : const Color(0xAA1F1F1F),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Text(
            text,
            style: TextStyle(
              color:
                  selectedMode == text ? Colors.white : const Color(0xFFB4B4B4),
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
