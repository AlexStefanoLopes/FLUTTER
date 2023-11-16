import 'package:banco_dados/Banco.dart';
import 'package:banco_dados/Produto.dart';
import 'package:flutter/material.dart';

class Excluir extends StatefulWidget {
  const Excluir({super.key});

  @override
  State<Excluir> createState() => _ExcluirState();
}

class _ExcluirState extends State<Excluir> {

  @override
  void initState(){
    super.initState();
    getListaProdutos();
  }

  Banco banco = Banco();
  List<Produto> listaProdutos = [];

  getListaProdutos() async{
    List lista = await banco.getProdutos();
    //zerar lista
    lista.forEach((element) {
      Produto p = Produto();
      p.id = element["id"];
      p.nome = element["nome"];
      p.nome = element["marca"];
      p.preco = element["preco"];
      p.validade = element["validade"];
      setState(() {
        listaProdutos.add(p);
      });

    });

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: ListView.builder(
        itemCount: listaProdutos.length,
        itemBuilder: (context, indice){
          return
        },
      ),
    );
  }
}
