import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';//diretório
import 'dart:io';//arquivo
import 'package:async/async.dart';//json
import 'dart:convert';//json

class Principal extends StatefulWidget {
  const Principal({Key? key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {

  @override
  void initState();
    super.initState();
    lerArquivo().then((conteudo){
      set
  });
    });
}

  salvarArquivo() async{
    //acessando diretorio
    final diretorio = await getApplicationCacheDirectory();
    print("diretorio ==> +diretorio.path");
    //criando arquivo
    File arquivo = File(diretorio.path+"/arquivo.json");

    //converter e graver em json
    String conteudo = json.encode(listaItens);
    arquivo.writeAsString(conteudo);
  }

  lerArquivo() async{
    try{
      final diretorio = await getApplicationCacheDirectory();
      File arquivo = File(diretorio.path + "/arquivo.json");
      return arquivo.readAsString();

    }catch(erro){
      print("Erro:"+erro.toString());
      return null;
    }


  }

  List<Map<String, dynamic>> listaItens = [];
  TextEditingController campoItem = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: listaItens.length,
              itemBuilder: (context, indice) {
                return CheckboxListTile(
                  title: Text(listaItens[indice]['nome']),
                  value: listaItens[indice]['finalizado'],
                  onChanged: (valor) {
                    setState(() {
                      listaItens[indice]['finalizado'] = valor;
                    });
                    salvarArquivo();
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("ADICIONAR ITEM"),
                content: TextField(
                  decoration: InputDecoration(
                    labelText: "Digite o item a incluir",
                  ),
                  controller: campoItem,
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Map<String, dynamic> item = {
                        'nome': campoItem.text,
                        'finalizado': false,
                      };

                      setState(() {
                        listaItens.add(item);
                      });
                      campoItem.text = "";
                      Navigator.pop(context);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Item incluído com sucesso"),
                        duration: Duration(seconds: 3),
                        backgroundColor: Colors.blue)
                      );
                    },
                    child: Text("SALVAR"),
                  ),
                ],
              );
            },
          );
        },
        label: Text("ADICIONAR A LISTA"),
        icon: Icon(
          Icons.ad_units,
          color: Colors.green,
        ),
      ),
    );
  }
}
