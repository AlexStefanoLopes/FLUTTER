import 'package:flutter/material.dart';
import 'package:projetologin/TelaLogada.dart';

class TelaLogin extends StatefulWidget {
  TelaLogin({Key? key}) : super(key: key);

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {

  TextEditingController campoUsuario = TextEditingController();
  TextEditingController campoSenha = TextEditingController();
  bool senha = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela de login"),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Informe o usuário",
                ),
                controller: campoUsuario,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Informe a senha",
                ),
                controller: campoSenha,
                obscureText: senha,
                onTap: () {
                  setState(() {
                    senha = !senha;
                  });
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String usuarioBanco = "admin";
                String senhaBanco = "1234";

                if (campoUsuario.text == usuarioBanco && campoSenha.text == senhaBanco) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TelaLogada(),
                    ),
                  );
                }
              },
              child: Text("LOGAR"),
            ),
          ],
        ),
      ),
    );
  }
}
