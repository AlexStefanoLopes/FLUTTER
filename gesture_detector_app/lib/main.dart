import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Principal(),

debugShowCheckedModeBanner: false,
  ));
}

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gesture Detector"),
      ),
      body: Container(
        child: Column(
          children: [
            GestureDetector(
              child: Image.asset("imagens/feaf.jpg"),
              onTap: (){
                print("Clicado: 1x");
              },
              onLongPress: (){
                print("Clicado: LongPress");
              },
              onDoubleTap: (){
                print("Clicado: 2x");
              },

            ),
            Image.asset("imagens/feaf.jpg"),
            Image.asset("imagens/JPG_29711.png")
          ],
        ),
      ),
    );
  }
}

