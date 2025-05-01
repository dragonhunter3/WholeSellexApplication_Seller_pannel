import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/app_colors.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/global_variables.dart';

class CustomBarChart extends StatelessWidget {
  const CustomBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return BarChart(
          BarChartData(
            barGroups: _createBarGroups(),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) => Text(
                    '${(8 + value * 0.2).toStringAsFixed(1)}m',
                    style: textTheme(context).labelMedium,
                  ),
                ),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    final months = ['Jan', 'Feb', 'Mar', 'Apr'];
                    return Text(
                      months[value.toInt()],
                      style: textTheme(context).labelMedium,
                    );
                  },
                ),
              ),
            ),
            gridData: FlGridData(show: false),
            borderData: FlBorderData(show: false),
            barTouchData: BarTouchData(enabled: false),
            maxY: 1.0,
          ),
        );
      },
    );
  }

  List<BarChartGroupData> _createBarGroups() {
    final lifetimeValues = [8.7, 8.4, 8.5, 8.1];
    final customerCosts = [8.5, 8.6, 8.1, 8.3];

    return List.generate(lifetimeValues.length, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: lifetimeValues[index] - 8,
            color: Colors.blue,
            width: 10,
            borderRadius: BorderRadius.circular(0),
          ),
          BarChartRodData(
            toY: customerCosts[index] - 8,
            color: AppColor.appOrange,
            width: 10,
            borderRadius: BorderRadius.circular(0),
          ),
        ],
        barsSpace: 4,
      );
    });
  }
}
