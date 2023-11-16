import 'package:flutter/material.dart';
import 'package:shared_novo/Tela2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Tela1 extends StatefulWidget {
  const Tela1({Key? key}) : super(key: key);

  @override
  State<Tela1> createState() => _Tela1State();
}

class _Tela1State extends State<Tela1> {
  TextEditingController campoUsuario = TextEditingController();
  TextEditingController campoSenha = TextEditingController();

  salvarDados(String usuario, String senha) async {
    print("Salvando dados");
    final pref = await SharedPreferences.getInstance();
    await pref.setString('usuario', usuario);
    await pref.setString("senha", senha);
  }

  excluirDados() async{
    final pref = await SharedPreferences.getInstance();
    await pref.remove("usuario");
    await pref.remove("senha");
    
  }


  lerDados() async {
    print("Buscando dados");
    final pref = await SharedPreferences.getInstance();
    String? usuario = pref.getString('usuario');
    String? senha = pref.getString('senha');
    if (usuario == 'admin' && senha == '123') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Tela2(usuario!, senha!),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    lerDados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela 1 Shared Preferences"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "USUÁRIO",
              ),
              controller: campoUsuario,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "SENHA",
              ),
              controller: campoSenha,
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                salvarDados(campoUsuario.text, campoSenha.text);
                if (campoUsuario.text == "admin" && campoSenha.text == "123") {
                  // Não faça nada aqui, pois a navegação já está no método lerDados()
                }
              },
              child: Text("LOGAR"),
            )
          ],
        ),
      ),
    );
  }
}
