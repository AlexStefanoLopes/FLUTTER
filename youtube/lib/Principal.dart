import 'package:flutter/material.dart';
import 'package:youtube/Biblioteca.dart';
import 'package:youtube/EmAlta.dart';
import 'package:youtube/Inicio.dart';
import 'package:youtube/Inscricoes.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class Principal extends StatefulWidget {
  const Principal({Key? key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {

  int indiceSelecionado = 0;

  List telas = [
    Inicio(),
    EmAlta(),
    Inscricoes(),
    Biblioteca()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "images/youtube.png",
          width: 97,
          height: 30,),

        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),

        actions: [
          IconButton(onPressed: (){
            print("click: Camera");
          },
              icon: Icon(Icons.videocam)),
          IconButton(onPressed: (){
            print("click: Pesquisa");
          },
              icon: Icon(Icons.search)),
          IconButton(onPressed: (){
            print("click: Conta");
          },
              icon: Icon(Icons.account_circle))

        ],
 
      ),

      body: telas[indiceSelecionado],
      bottomNavigationBar: BottomNavigationBar(

        onTap: (indice){
          setState(() {
            indiceSelecionado = indice;
          });
        },


        type: BottomNavigationBarType.fixed,
        // unselectedItemColor: Colors.yellow ,
        fixedColor: Colors.red,

        currentIndex: indiceSelecionado,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Início",
            backgroundColor: Colors.purple
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.whatshot),
            label: "Em alta",
            backgroundColor: Colors.deepOrange
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder_copy),
            label: "Inscrições",
            backgroundColor: Colors.green
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder_copy),
            label: "Biblioteca",
            backgroundColor: Colors.black
          ),

        ],
      ),
    );
  }
}
