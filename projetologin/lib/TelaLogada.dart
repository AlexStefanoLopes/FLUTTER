import 'package:flutter/material.dart';

class TelaLogada extends StatefulWidget {
  const TelaLogada({super.key});

  @override
  State<TelaLogada> createState() => _TelaLogadaState();
}

class _TelaLogadaState extends State<TelaLogada> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("LOGADO COM SUCESSO"),
    );
  }
}
