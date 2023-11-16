import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import "dart:convert";
import "dart:async";

class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {

  List<Map<String, dynamic>> listaMoedas = [];

  Future<Map<String, dynamic>> buscarCotacao() async {
    String url = "https://blockchain.info/ticker";
    http.Response resposta = await http.get(Uri.parse(url));
    Map<String, dynamic> lista = json.decode(resposta.body);
    return lista;
  }

  String respostaServidor = "";

  @override
  Widget build(BuildContext context) {
    buscarCotacao();
    return Scaffold(
      appBar: AppBar(
        title: Text("Cotações"),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: buscarCotacao(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              print("conexão aguardando");
              respostaServidor = "\nAGUARDANDO";
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              print("conexão finalizada");
              respostaServidor = "\nFINALIZADO";

              if (snapshot.hasError) {
                respostaServidor = "Erro ao carregar dados da internet";
              } else {
                snapshot.data?.values.forEach((element) {
                  //  print(element["Símbolo: "+element["symbol"]);
                  //  print(element["Compra: "+element["buy"].toString());
                  Map<String, dynamic> moeda = Map();
                  moeda["nome"] = element["symbol"];
                  moeda["cotacao"] = element["buy"];
                  listaMoedas.add(moeda);
                });
              }

              break;
          }
          return Padding(
            padding: EdgeInsets.all(20),
            child: ListView.builder(
              itemCount: listaMoedas.length,
              itemBuilder: (context, indice) {
                print("");
                return ListTile(
                  title: Text(listaMoedas[indice]["nome"]),
                  subtitle: Text(listaMoedas[indice]["cotacao"].toString()),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
