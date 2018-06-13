import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:crypto_app/model/crypto.dart';
import 'package:crypto_app/view/v_crypto.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Cripto App',
      home: new ScopedModel<CryptoModel>(
        model: CryptoModel(),
        child: new ViewCrypto(),
      ),
    );
  }
}
