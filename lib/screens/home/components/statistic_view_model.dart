import 'package:flutter/material.dart';
import 'package:pccovid/models/country_statistic.dart';
import 'package:pccovid/models/world_statistic.dart';
import 'package:pccovid/screens/home/components/range_selection_view.dart';
import 'package:pccovid/services/statistic_service.dart';

class StatisticViewModel with ChangeNotifier {
  int? confirmed;
  int? recovered;
  int? deaths;

  CountryStatistic? _countryData;
  WorldStatistic? _worldData;
  TrackerRange _range = TrackerRange.country;

  _fetchCountryStatisticData() async {
    _countryData = await StatisticService().fetchCountryCovidDatas();
    _updateWithCountryData();
  }

  _fetchWorldStatisticData() async {
    _worldData = await StatisticService().fetchWorldCovidDatas();
    _updateWithWorldData();
  }

  prepareDatas() {
    _fetchCountryStatisticData();
    _fetchWorldStatisticData();
  }

  update(TrackerRange range) {
    if (range == _range) {
      return;
    }
    _range = range;
    if (range == TrackerRange.country) {
      _updateWithCountryData();
    } else {
      _updateWithWorldData();
    }

    notifyListeners();
  }

  _updateWithCountryData() {
    if (_range != TrackerRange.country) {
      return;
    }

    confirmed = _countryData?.infected;
    recovered = _countryData?.recovered;
    deaths = _countryData?.died;

    notifyListeners();
  }

  _updateWithWorldData() {
    if (_range != TrackerRange.worldwide) {
      return;
    }

    confirmed = _worldData?.confirmed;
    recovered = _worldData?.recovered;
    deaths = _worldData?.deaths;

    notifyListeners();
  }
}
