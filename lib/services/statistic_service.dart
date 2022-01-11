import 'dart:convert';
import 'package:pccovid/models/country_statistic.dart';
import 'package:http/http.dart' as http;
import 'package:pccovid/models/world_statistic.dart';

class StatisticService {
  final String _getCountryStatisticURL =
      "https://api.apify.com/v2/key-value-stores/EaCBL1JNntjR3EakU/records/LATEST?disableRedirect=true";
  final String _getWorldwideStatisticURL =
      "https://api.covid19api.com/world/total";

  Future<CountryStatistic> fetchCountryCovidDatas() async {
    var url = Uri.parse(_getCountryStatisticURL);
    var response = await http.get(url);
    var data = json.decode(response.body);
    var countryStatistic = CountryStatistic.fromJson(data);

    return countryStatistic;
  }

  Future<WorldStatistic> fetchWorldCovidDatas() async {
    var url = Uri.parse(_getWorldwideStatisticURL);
    var response = await http.get(url);
    var data = json.decode(response.body);
    var statisticData = WorldStatistic.fromJson(data);

    return statisticData;
  }
}
