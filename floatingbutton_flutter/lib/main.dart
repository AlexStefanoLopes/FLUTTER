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
        title: Text("Floating"),
      ),
      body: Container(),

      floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
            print("Floating clicado");

      }, label: Text("OK"),
          icon: Icon(Icons.ad_units),
        backgroundColor: Colors.green,
        tooltip: "Testesss",
        focusElevation: 30,
        focusColor: Colors.green,
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,


      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.blue,
        child: Row(
          children: [
            IconButton(
                color: Colors.orange,
                onPressed: (){

            },
                icon: Icon(Icons.menu_book)),
            IconButton(
                color: Colors.orange,
                onPressed: (){

                },
                icon: Icon(Icons.abc_rounded)),
          ],
        ),
      ),
    );
  }
}
