import 'package:flutter/material.dart';
import  'package:audioplayers/audioplayers.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {

  AudioPlayer audioPlayer = AudioPlayer();
  AssetSource musica = AssetSource("musicas/hard-work-short-109942.mp3");
  double volume = 1;

  tocarMusica(){
    audioPlayer.play(musica);
    audioPlayer.setVolume(volume);
  }

  @override
  Widget build(BuildContext context) {
    tocarMusica();
    return Scaffold(
      appBar: AppBar(
        title: Text("Músicas e Som"),
      ),
    );
  }
}
