import 'package:http/http.dart' as http;
import 'dart:convert' show jsonDecode;
import 'package:youtube/Video.dart';

const CHAVE_GOOGLE = 'AIzaSyB7q3mgSZXgdlvijpMz1OptyiN58A3jT1E';
const ID_CANAL = 'UCZDsqSxJMnEsPg8Jm4FH8dQ';
const URL = 'https://www.googleapis.com/youtube/v3/search';

class Api{

  pesquisar(String pesquisa) async{

    http.Response resposta = await http.get(
      Uri.parse(
        URL + "?part=snippet"
            "&type=vide"
            "&maxResults=15"
            "&order=date"
            "&channelId=${ID_CANAL}"
            "&key=${CHAVE_GOOGLE}"
            "&q=${pesquisa}"
      )
    );
    
    if (resposta.statusCode == 200) {
      // print("Resultado:" + resposta.body);
      Map<String, dynamic> dadosJson = jsonDecode(resposta.body);
      // print("dados-->" + dadosJson["items"][0]["snippet"]["title"]);
      List<Video> listaVideos = dadosJson["items"].map<Video>(
              (map) {
            return Video.fromJson(map);
          }
      ).toList();
      for (var v in listaVideos) {
        print(v.imagem);
      }
      return listaVideos;
    }else{
      print("Erro ao buscar vídeo");
      return List.empty();
    }

  }

}