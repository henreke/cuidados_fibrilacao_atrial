import 'package:cuidados_fibrilacao_atrial/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
class ExameManager{
  late String? uid;
  late String? foto;
  late String? extensao;


  ExameManager({this.uid, this.foto,this.extensao});

  enviarFoto() async{
    var response = await http.post(
      Uri.parse("${Utils.server_path}/Users/saveFoto.php"),
      body: json.encode({'uid':uid,'foto':foto,'extensao':extensao}),
      headers: {'Content-Type': 'application/json'},
    );

    var mapa = jsonDecode(response.body);
    print(mapa['success']);
  }
}