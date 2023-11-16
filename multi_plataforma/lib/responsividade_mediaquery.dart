import 'package:flutter/material.dart';

class Responsividade_MediaQuery extends StatefulWidget {
  const Responsividade_MediaQuery({super.key});

  @override
  State<Responsividade_MediaQuery> createState() => _Responsividade_MediaQueryState();
}

class _Responsividade_MediaQueryState extends State<Responsividade_MediaQuery> {
  @override
  Widget build(BuildContext context) {
    
    var largura = MediaQuery.of(context).size.width;
    var altura = MediaQuery.of(context).size.height;
    var alturaApp = AppBar().preferredSize.height;
    var alturaBarraStatus = MediaQuery.of(context).padding.top;


    return Scaffold(
      appBar: AppBar(
          title: Text("MediaQuery"),
    ),
      body: Column(
        children: [
          Container(
            color: Colors.green,
            width: largura,
            height: altura,
          ),
      Container(
        color: Colors.green,
        width: largura,
        height: altura,
      ),
          Container(
          color: Colors.green,
          width: largura,
          height: altura, ),], ), );
  }
}
