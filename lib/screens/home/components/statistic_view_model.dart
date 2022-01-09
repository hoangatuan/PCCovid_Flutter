import 'package:flutter/material.dart';
import 'package:pccovid/models/country_statistic.dart';
import 'package:pccovid/services/statistic_service.dart';

class StatisticViewModel with ChangeNotifier {
  CountryStatistic? data;

  fetchCountryStatisticData() async {
    data = await StatisticService().fetchCountryCovidDatas();
    notifyListeners();
  }
}
