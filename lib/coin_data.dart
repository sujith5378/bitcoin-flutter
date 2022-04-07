import 'dart:convert';
import 'package:http/http.dart' as http;

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

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'CD811CF1-E127-44E0-995E-BBF43C8CECEC';


class CoinData {
  Future getCoinData(String selectedCurrency) async {
    Map<String,String> cryptoprice = {};
    for (String crypto in cryptoList) {
    String requestURL = '$coinAPIURL/$crypto/$selectedCurrency?apikey=$apiKey';
    http.Response response = await http.get(requestURL);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      double lastPrice = decodedData['rate'];
      cryptoprice[crypto] = lastPrice.toStringAsFixed(0);
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
    }
   return cryptoprice;
  }
}
