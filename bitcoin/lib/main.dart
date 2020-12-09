import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double resultado = 0;
  _atualizar() async {
    http.Response response;
    String url = 'https://blockchain.info/ticker';
    response = await http.get(url);
    Map<String, dynamic> valor = jsonDecode(response.body);
    valor = valor['BRL'];
    setState(() {
      resultado = valor['sell'];
    });
    print(resultado);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('imagem/bitcoin.png'),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text(resultado.toString(), style: TextStyle(fontSize: 45),),
              ),
              RaisedButton(
                color: Colors.orange,
                onPressed: _atualizar,
                child: Text('Atualizar', style: TextStyle(color: Colors.white),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
