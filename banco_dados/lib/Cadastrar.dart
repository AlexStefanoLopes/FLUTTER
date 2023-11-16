import 'package:banco_dados/Banco.dart';
import 'package:banco_dados/Produto.dart';
import 'package:flutter/material.dart';

class Cadastrar extends StatefulWidget {
  const Cadastrar({super.key});

  @override
  State<Cadastrar> createState() => _CadastrarState();
}

class _CadastrarState extends State<Cadastrar> {

  Banco banco = Banco();
  TextEditingController campoNome = TextEditingController();
  TextEditingController campoMarca = TextEditingController();
  TextEditingController campoPreco = TextEditingController();
  TextEditingController campoValidade = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Nome do Produto",
                hintText: "Informe o nome"
              ),
              style: TextStyle(
                fontSize: 16,
              ),
              controller: campoNome,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: "Marca do Produto",
                  hintText: "Informe a Marca"
              ),
              style: TextStyle(
                fontSize: 16,
              ),
              controller: campoMarca,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: "Preço do Produto",
                  hintText: "Informe o preço"
              ),
              style: TextStyle(
                fontSize: 16,
              ),
              controller: campoPreco,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: "Validade do Produto",
                  hintText: "Informe a Validade"
              ),
              style: TextStyle(
                fontSize: 16,
              ),
              controller: campoValidade,
            ),
            Padding(padding: EdgeInsets.all(20),
            child: ElevatedButton(
              child: Text("SALVAR"),
              onPressed: (){
                print("SALVANDO PRODUTO");
                Produto p = Produto();
                p.nome = campoNome.text;
                p.marca = campoMarca.text;
                p.preco = double.parse(campoPreco.text);
                p.validade = campoValidade.text;
                banco.salvar(p);

                campoNome.text = "";
                campoMarca.text = "";
                campoPreco.text = "";
                campoValidade.text = "";

              },
            ),),
            

          ],
        ),
      ),
    );
  }
}
