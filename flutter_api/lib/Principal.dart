import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // Use AppBar com um Text como título
        title: Text("Flutter INMET"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Informe o código da Estação Ex.A385",
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top:20),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Informe a data Ex. 2022-08-09"
              ),
            ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: ElevatedButton(
                  onPressed: (){

                  },
                  child: Text("ACESSAR"),
                )
                ,)
          ],
        ),
      ),
    );
  }
}