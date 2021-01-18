import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const apiKey = "4A921F34-9B69-454D-A436-3CB543BF4354";
class CoinData {

  Future getCoinData(currency) async{

    Map<String,String> cryptoPrices = {};
    for(String crypto in cryptoList) {

      String url = "https://rest.coinapi.io/v1/exchangerate/$crypto/$currency?apikey=$apiKey";
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        double lastPrice = jsonResponse['rate'];
        cryptoPrices[crypto] = lastPrice.toStringAsFixed(0);
      } else {
        print('Request failed with status: ${response.statusCode}.');
        throw 'Problem with the get request';
      }
    }
    return cryptoPrices;
  }

}