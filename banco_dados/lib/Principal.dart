import 'dart:ffi';

import 'package:banco_dados/Alterar.dart';
import 'package:banco_dados/Banco.dart';
import 'package:banco_dados/Cadastrar.dart';
import 'package:banco_dados/Excluir.dart';
import 'package:banco_dados/Excluir.dart.dart';
import 'package:banco_dados/Listar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Produto.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {

  int indiceSelecionado = 0;
  List telas = [
    Listar(),
    Cadastrar(),
    Alterar(),
    Excluir(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'images/paranoid.jpg',
        width: 100,
        height: 100,),
      ),
      body: telas[indiceSelecionado],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indiceSelecionado,
        type: BottomNavigationBarType.shifting,

        onTap: (indice){
          setState(() {
            indiceSelecionado = indice;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.list_alt),
              label: "Listar",
              backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_alt_outlined),
            label: "Cadastrar",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.security_update_good),
            label: "Alterar",
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delete),
            label: "Excluir",
            backgroundColor: Colors.red,
          ),
        ],

      ),


    );
  }
}




// Banco banco = Banco();
// banco.buscarBanco();
// Produto p = Produto();
// p.id = 2;
// p.nome = "Soja";
// p.marca = "IDR";
// p.preco = 300;
// p.validade = "24/10/2023";
// banco.alterarProduto(p);
// banco.salvar(p);
// banco.getProdutos();
// banco.apagarProduto(1);