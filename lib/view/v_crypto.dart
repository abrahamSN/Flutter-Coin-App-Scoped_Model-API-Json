import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:crypto_app/model/crypto.dart';

class ViewCrypto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Crypto'),
      ),
      body: new ScopedModelDescendant<CryptoModel>(
          builder: (context, child, model) => new ListView(
                children: model.cryptos.map((coin) => new ListTile(
                  title: new Text(coin.name),
                  leading: new CircleAvatar(
                    child: new Text(coin.symbol),
                    backgroundColor: Colors.blue,
                  ),
                  subtitle: new Text(coin.priceUsd),
                )).toList(),
              )),
      floatingActionButton: new ScopedModelDescendant<CryptoModel>(
        builder: (context, child, model) => new FloatingActionButton(
              onPressed: model.fetchCrypto,
              tooltip: 'get',
              child: new Icon(Icons.refresh),
            ),
      ),
    );
  }
}
