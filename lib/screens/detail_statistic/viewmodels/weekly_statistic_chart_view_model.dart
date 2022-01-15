import 'package:flutter/material.dart';
import 'package:pccovid/models/daily_statistic.dart';
import 'package:pccovid/services/statistic_service.dart';
import 'dart:math';

class StatisticChartViewModel extends ChangeNotifier {
  List<DailyStatistic> _weeksStatistic = [];

  double get maxYValue {
    int maxVal = 10;
    for (int i = 0; i < _weeksStatistic.length; i++) {
      maxVal = max(maxVal, _weeksStatistic[i].cases);
    }

    return maxVal * 1.2;
  }

  int get numberOfDays {
    return _weeksStatistic.length;
  }

  StatisticChartViewModel() {
    _fetchCountryStatisticData();
  }

  _fetchCountryStatisticData() async {
    var countryStatatis = await StatisticService().fetchCountryCovidDatas();
    _weeksStatistic = countryStatatis.overview;
    notifyListeners();
  }

  String getBottomTitle(int index) {
    String date = _weeksStatistic[index].date;
    var splitArr = date.split("-");
    return "${splitArr[0]}/${splitArr[1]}";
  }

  double getTotalCases(int index) {
    return _weeksStatistic[index].cases.toDouble();
  }
}
