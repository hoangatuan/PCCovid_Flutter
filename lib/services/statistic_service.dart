import 'dart:convert';
import 'package:pccovid/models/country_statistic.dart';
import 'package:http/http.dart' as http;

class StatisticService {
  final String _url =
      "https://api.apify.com/v2/key-value-stores/EaCBL1JNntjR3EakU/records/LATEST?disableRedirect=true";

  Future<CountryStatistic> fetchCountryCovidDatas() async {
    var url = Uri.parse(_url);
    var response = await http.get(url);
    var data = json.decode(response.body);
    var countryStatistic = CountryStatistic.fromJson(data);

    return countryStatistic;
  }
}
