import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';
import 'package:heypay/utils/color_manager.dart';
import 'package:heypay/utils/layouts.dart';
import 'package:heypay/widgets/my_app_bar.dart';
import 'package:heypay/widgets/transactions_list.dart';

class Stats extends StatefulWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  int segmentedControlValue = 0;

  @override
  Widget build(BuildContext context) {
    final size = Layouts.getSize(context);

    return Scaffold(
      backgroundColor: ColorManager.bgColor(context),
      appBar: myAppBar(
          title: 'Stats',
          implyLeading: false,
          context: context,
          hasAction: true),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: <Widget>[
          totalBalanceCard(context),
          const Gap(20),
          statsAndGraphView(context),
          const Gap(20),
          transactionListingView(context)
        ],
      ),
    );
  }

  Container statsAndGraphView(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: ColorManager.accentColor2(context),
            borderRadius: BorderRadius.circular(20),
            border:
                Border.all(color: ColorManager.accentColor(context), width: 3)),
        child: Column(children: [
          segmentedControl(),
          AspectRatio(
            aspectRatio: 1.70,
            child: LineChart(
              graphData(),
            ),
          ),
        ]));
  }

  Container totalBalanceCard(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ColorManager.accentColor2(context),
        border: Border.all(width: 3, color: ColorManager.accentColor(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 5),
              child: Text('Total Balance',
                  style: TextStyle(color: ColorManager.subTextColor(context)))),
          Divider(
            color: ColorManager.dividerColor(context),
            thickness: 2,
          ),
          Container(
              padding: const EdgeInsets.fromLTRB(20, 25, 20, 30),
              child: Text('\330.00 USD',
                  style: TextStyle(
                      color: ColorManager.titleColor(context),
                      fontSize: 32,
                      fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }

  Widget segmentedControl() {
    return Container(
      padding: const EdgeInsets.all(5),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border:
              Border.all(color: ColorManager.accentColor(context), width: 2)),
      child: CupertinoSlidingSegmentedControl(
        groupValue: segmentedControlValue,
        padding: const EdgeInsets.all(5),
        backgroundColor: ColorManager.segmentbgColor(context),
        thumbColor: ColorManager.segmentThumbColor(context),
        children: const <int, Widget>{0: Text('Income'), 1: Text('Expenses')},
        onValueChanged: (value) {
          setState(() {
            segmentedControlValue = value as int;
          });
        },
      ),
    );
  }

  LineChartData graphData() {
    List<Color> gradientColors = [ColorManager.selectedItemColor(context)];
    return LineChartData(
      gridData: FlGridData(
        show: false,
        drawVerticalLine: false,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.transparent,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            //color: Repository.selectedItemColor(context),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
            sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 40,
          interval: 1.1,
        )),
        leftTitles: AxisTitles(
            sideTitles: SideTitles(
          showTitles: false,
          interval: 1,
        )),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(
            color: ColorManager.selectedItemColor(context), width: 1),
      ),
      minX: 0,
      maxX: 9,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            const FlSpot(0, 3),
            const FlSpot(1.5, 3),
            const FlSpot(3.5, 5),
            const FlSpot(5, 3),
            const FlSpot(6.5, 4),
            const FlSpot(8, 2.8),
            const FlSpot(9, 3),
          ],
          isCurved: true,
          barWidth: 2.5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
          ),
        ),
      ],
    );
  }
}
