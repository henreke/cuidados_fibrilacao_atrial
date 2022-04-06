import 'package:cuidados_fibrilacao_atrial/data/exame.dart';
import 'package:cuidados_fibrilacao_atrial/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:rxdart/rxdart.dart';
class ExameManager{

    BehaviorSubject<bool> _blcisLoading =  BehaviorSubject<bool>.seeded(false);
    Stream<bool> get isLoading =>_blcisLoading.stream;

    void dispose(){
      _blcisLoading.close();
    }

    Future<int> cadExame({required Exame exame,required void Function() onSuccess, required void Function() onFail}) async{

      _blcisLoading.add(true);
    var response = await http.post(
      Uri.parse("${Utils.server_path}/exames/cadExame.php"),
      body: json.encode(exame.toJson()),
      headers: {'Content-Type': 'application/json'},
    );



    var mapa = jsonDecode(response.body);
    _blcisLoading.add(false);
    if (mapa["success"] > 0){
      onSuccess();
    } else {
      onFail();
    }
    return mapa["success"];

  }
}