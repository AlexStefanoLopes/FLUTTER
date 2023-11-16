import "package:flutter/material.dart";
import "package:youtube/API.dart";
import "package:youtube/Video.dart";
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  Future<List<Video>> buscar(String pesquisa) async {
    Api api = Api();
    List<Video> videos = await api.pesquisar(pesquisa);
    return videos;
  }



  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
        future: buscar("MILHO"),
        builder: (context, snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              print("Conexão em espera");
              return Center(
                child: Text("Nenhum vídeo a ser exibido atualmente"),
              );

            case ConnectionState.done:
              print("Conexão finalizada");
              if(snapshot.hasData){
                return ListView.separated(
                    itemBuilder: (context, index){
                      List<Video>? lista = snapshot.data as List<Video>;
                      Video video = lista![index];
                      return YoutubePlayerBuilder(
                          player: YoutubePlayer(
                            controller: YoutubePlayerController(
                                initialVideoId: video.id,
                                flags: YoutubePlayerFlags(
                                  autoPlay: false,
                                )
                            ),
                          ),
                          builder: (context, player){
                            return Column(
                              children: [
                                player,
                                ListTile(
                                  title: Text(video.titulo),
                                  subtitle: Text(video.descricao),
                                )
                              ],
                            );
                          }
                      );
                    },
                    separatorBuilder: (context, index)=>Divider(
                      height: 2,
                      color: Colors.grey,
                    ),
                    itemCount: (snapshot.data! as List<Video>).length
                );
              }else{
                return Center(
                  child: Text("Nenhum vídeo a ser exibido atualmente"),
                );
              }
          }

        }
    );
  }
}
