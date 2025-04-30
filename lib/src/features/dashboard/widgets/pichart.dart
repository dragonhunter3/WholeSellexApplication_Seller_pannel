import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:tuple/tuple.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/app_colors.dart';

class CustomPichart extends StatelessWidget {
  const CustomPichart({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    double? radius;
    if (width < 600) {
      radius = 100;
    } else if (width < 1024) {
      radius = 120;
    } else {
      radius = 150;
    }
    final chartdata = <Tuple3<String, double, Color>>[
      Tuple3("New Customer", 1000, AppColor.appRed),
      Tuple3("Returning Customer", 500, AppColor.appOrange),
    ];

    final dataMap = {
      for (var item in chartdata) item.item1: item.item2,
    };

    final colorList = [for (var item in chartdata) item.item3];

    return Column(
      children: [
        PieChart(
          dataMap: dataMap,
          animationDuration: const Duration(milliseconds: 800),
          chartLegendSpacing: 32,
          chartRadius: radius,
          initialAngleInDegree: 0,
          chartType: ChartType.ring,
          ringStrokeWidth: 20,
          colorList: colorList,
          legendOptions: const LegendOptions(
            showLegends: false,
          ),
          emptyColor: AppColor.appYellow,
        ),
      ],
    );
  }
}
