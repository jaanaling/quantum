import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quantum/src/feature/balance/models/history.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
        primaryXAxis: DateTimeAxis(),
        primaryYAxis: NumericAxis(
          title: AxisTitle(text: 'Price'),
        ),
        title: ChartTitle(text: 'Price History'),
        legend: Legend(isVisible: false),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: [
          LineSeries<History, DateTime>(
            dataSource: widget.history,
            xValueMapper: (History history, _) =>
             history.date,
            yValueMapper: (History history, _) => history.asset.currentPrice,
            name: 'Price',
            color: Colors.blue,
            markerSettings: MarkerSettings(isVisible: true),
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
  late List<_ChartData> chartData;

  @override
  void initState() {
    super.initState();
    chartData = _getChartData('Day');
  }

  List<_ChartData> _getChartData(String mode) {
    // Пример данных. Здесь можно заменить на ваши данные из портфеля.
    final List<_ChartData> data = [
      _ChartData('AAPL', 5000, 4500), // Прибыль/расход за день
      _ChartData('GOOGL', 7000, 7500),
      _ChartData('TSLA', 8000, 9000),
    ];
    return data;
  }

  void _onModeChanged(String mode) {
    setState(() {
      selectedMode = mode;
      chartData = _getChartData(mode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton<String>(
          value: selectedMode,
          items: ['Day', 'Week', 'Month', 'Year']
              .map((mode) => DropdownMenuItem(
                    value: mode,
                    child: Text(mode),
                  ))
              .toList(),
          onChanged: (value) {
            if (value != null) _onModeChanged(value);
          },
        ),
        Expanded(
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            title: ChartTitle(text: 'Profit/Loss Performance'),
            legend: Legend(isVisible: true),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: [
              ColumnSeries<_ChartData, String>(
                dataSource: chartData,
                xValueMapper: (_ChartData data, _) => data.assetName,
                yValueMapper: (_ChartData data, _) => data.profit,
                name: 'Profit',
                color: Colors.green,
              ),
              ColumnSeries<_ChartData, String>(
                dataSource: chartData,
                xValueMapper: (_ChartData data, _) => data.assetName,
                yValueMapper: (_ChartData data, _) => data.loss,
                name: 'Loss',
                color: Colors.red,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ChartData {
  final String assetName;
  final double profit;
  final double loss;

  _ChartData(this.assetName, this.profit, this.loss);
}
