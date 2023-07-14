import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:freelance_task/utils/colors.dart';
import 'package:get/get.dart';

class DataTasksController extends GetxController {
  RxInt touchedIndex = 0.obs;
  RxInt selectedHistoryBtn = 0.obs;
  Color exactBarColor = Colors.blue;
  Color touchedBarColor = Colors.indigoAccent;
  Color barBackgroundColor = AppColors.bgTertiaryColor;

  final List<Map<String, dynamic>> cardTitles = [
    {'name': 'COMPLETED', 'desc': '24 jobs', 'color': AppColors.boxFirstColor},
    {'name': 'TOTAL EARNED', 'desc': '\$ 824.00', 'color': AppColors.boxSecondColor},
    {'name': 'TOTAL USED', 'desc': '\$ 200.00', 'color': AppColors.boxThirdColor},
  ];

  final List<Map<String, dynamic>> taskData = [
    {'task_id': 1, 'pic': 'Maria S.', 'priority': 'HIGH', 'desc': 'We have a problem with our fridge. Seeking for a specialist to help us out.', 'severity': 'Critical', 'status': 'In Progress', 'device': 'Fridge', 'time': '30m', 'pic_image': 'image_1'},
    {'task_id': 2, 'pic': 'Daniel P.', 'priority': 'NORMAL', 'desc': 'Our TV is not working anymore, I think the screen is damaged. Need help.', 'severity': 'Critical', 'status': 'In Progress', 'device': 'Television', 'time': '1h', 'pic_image': 'image_2'},
    {'task_id': 3, 'pic': 'Maria S.', 'priority': 'HIGH', 'desc': 'We have a problem with our fridge. Seeking for a specialist to help us out.', 'severity': 'Critical', 'status': 'In Progress', 'device': 'Fridge', 'time': '30m', 'pic_image': 'image_1'},
    {'task_id': 4, 'pic': 'Daniel P.', 'priority': 'NORMAL', 'desc': 'Our TV is not working anymore, I think the screen is damaged. Need help.', 'severity': 'Critical', 'status': 'In Progress', 'device': 'Television', 'time': '1h', 'pic_image': 'image_2'},
  ];

  final List<List<double>> barChartData = [
    [5, 4, 2, 7, 6, 5, 4],
    [15, 14, 12, 17, 16, 15, 14],
    [50, 40, 20, 70, 60, 50, 40],
  ];

  void clickedHistoryBtn(int btnClicked) {
    selectedHistoryBtn.value = btnClicked;
  }

  // Bar Chart =========================

  BarChartData sampleData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.blueGrey,
          tooltipHorizontalAlignment: FLHorizontalAlignment.right,
          tooltipMargin: -10,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            String weekDay;
            switch (group.x) {
              case 0:
                weekDay = 'Monday';
                break;
              case 1:
                weekDay = 'Tuesday';
                break;
              case 2:
                weekDay = 'Wednesday';
                break;
              case 3:
                weekDay = 'Thursday';
                break;
              case 4:
                weekDay = 'Friday';
                break;
              case 5:
                weekDay = 'Saturday';
                break;
              case 6:
                weekDay = 'Sunday';
                break;
              default:
                throw Error();
            }
            return BarTooltipItem(
              '$weekDay\n',
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: (rod.toY - 1).toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          },
        ),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          if (!event.isInterestedForInteractions || barTouchResponse == null || barTouchResponse.spot == null) {
            touchedIndex.value = -1;
            return;
          }
          touchedIndex.value = barTouchResponse.spot!.touchedBarGroupIndex;
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: FlGridData(show: true, drawVerticalLine: false),
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, barChartData[selectedHistoryBtn.value][0], isTouched: i == touchedIndex.value, barColor: const Color(0xFFF1EBFD));
          case 1:
            return makeGroupData(1, barChartData[selectedHistoryBtn.value][1], isTouched: i == touchedIndex.value, barColor: const Color(0xFF7540ED));
          case 2:
            return makeGroupData(2, barChartData[selectedHistoryBtn.value][2], isTouched: i == touchedIndex.value, barColor: const Color(0xFFFF5757));
          case 3:
            return makeGroupData(3, barChartData[selectedHistoryBtn.value][3], isTouched: i == touchedIndex.value, barColor: const Color(0xFF67C785));
          case 4:
            return makeGroupData(4, barChartData[selectedHistoryBtn.value][4], isTouched: i == touchedIndex.value, barColor: const Color(0xFFFF8345));
          case 5:
            return makeGroupData(5, barChartData[selectedHistoryBtn.value][5], isTouched: i == touchedIndex.value, barColor: const Color(0xFF5890FF));
          case 6:
            return makeGroupData(6, barChartData[selectedHistoryBtn.value][6], isTouched: i == touchedIndex.value, barColor: const Color(0xFFF1EBFD));
          default:
            return throw Error();
        }
      });

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color? barColor,
    double width = 14,
    List<int> showTooltips = const [],
  }) {
    barColor ??= exactBarColor;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched ? touchedBarColor : barColor,
          width: width,
          borderSide: isTouched ? BorderSide(color: touchedBarColor.withOpacity(0.8)) : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: barBackgroundColor,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    TextStyle style = TextStyle(
      color: const Color(0xFF361A76).withOpacity(0.5),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text('M', style: style);
        break;
      case 1:
        text = Text('T', style: style);
        break;
      case 2:
        text = Text('W', style: style);
        break;
      case 3:
        text = Text('T', style: style);
        break;
      case 4:
        text = Text('F', style: style);
        break;
      case 5:
        text = Text('S', style: style);
        break;
      case 6:
        text = Text('S', style: style);
        break;
      default:
        text = Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }
}
