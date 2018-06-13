import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:scoped_model/scoped_model.dart';

class Crypto {
  final String name;
  final String symbol;
  final String priceUsd;

  Crypto({this.name, this.symbol, this.priceUsd});

  Crypto.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        symbol = json['symbol'],
        priceUsd = json['price_usd'];
}

class CryptoModel extends Model {
  final List<Crypto> cryptos = new List<Crypto>();

  final String url = 'https://api.coinmarketcap.com/v1/ticker/';

  Future<List<Crypto>> fetchCrypto() async {
    var response = await http.get(url);

    var responseBody = await json.decode(response.body);

    for(var cryptoJson in responseBody) {
      cryptos.add(new Crypto.fromJson(cryptoJson));
    }

    notifyListeners();

    return cryptos;
  }

}
