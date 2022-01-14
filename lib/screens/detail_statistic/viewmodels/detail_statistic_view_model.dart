import 'package:flutter/material.dart';
import 'package:pccovid/models/country_statistic.dart';
import 'package:pccovid/services/statistic_service.dart';

class DetailStatisticViewModel extends ChangeNotifier {
  CountryStatistic? countryStatistic;

  DetailStatisticViewModel() {
    _fetchCountryStatisticData();
  }

  _fetchCountryStatisticData() async {
    countryStatistic = await StatisticService().fetchCountryCovidDatas();
    notifyListeners();
  }
}
