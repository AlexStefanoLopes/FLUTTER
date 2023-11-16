import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  List<Map<String, dynamic>> listaProduto = [];

  void getListaProduto() {
    for (int i = 0; i <= 10; i++) {
      Map<String, dynamic> produto = Map();
      produto["nome"] = "Nome $i";
      produto["descricao"] = "Descrição do produto Nome $i";
      listaProduto.add(produto);
    }
  }

  @override
  void initState() {
    super.initState();
    getListaProduto();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minha Lista"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: listaProduto.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(listaProduto[index]["nome"]),
              subtitle: Text(listaProduto[index]["descricao"]),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        listaProduto[index]["nome"],
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.blue,
                        ),
                      ),
                      content: Text(listaProduto[index]["descricao"]),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Lógica para salvar aqui
                                Navigator.of(context).pop(); // Fecha o diálogo
                              },
                              child: Text("Salvar"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Fecha o diálogo
                              },
                              child: Text("Cancelar"),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
