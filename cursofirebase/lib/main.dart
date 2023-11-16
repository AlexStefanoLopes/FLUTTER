import 'Principal.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  // Initialize Firebase

  autenticar();


  runApp(MaterialApp(
    home: Principal(),
  ));

  void iniciaFirebase()async {}

  void autenticador() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    FirebaseAuth auth = FirebaseAuth.instance;
    String email = "conta01@idr.pr.gov.br";
    String senha = "12345"; //ao menos 6 caracteres esse serviço do google exige


    //Criar usuário
    auth.createUserWithEmailAndPassword(
        email: email,
        password: senha).then((retornoFirebase) {
      print("Usuário cadastrado: ${retornoFirebase.user!.email}");
    }).catchError((erro){
      print("Erro ao cadastrar:${erro.toString()}");


    //Ver se o usuário está logado
    User? usuario = await auth.currentUser;
    if(usuario == null) {
      print("usuario deslogado");
    }else{
      print("usuario logado: ${usuario.email.toString()}");
    }

    auth.signOut();

    auth.signInWithEmailAndPassword(
        email: email,
        password: senha
    ).then((usuario){
      print("Usuario logado: ${usuario.user!.email}");
    })catchError((erro){
      print("Erro ao logar ${erro.toString()}");
        )};
 
  });





  }



}
