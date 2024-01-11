import 'package:cuidados_fibrilacao_atrial/data/has.dart';
import 'package:cuidados_fibrilacao_atrial/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:rxdart/rxdart.dart';
class HasManager{

  BehaviorSubject<bool> _blcisLoading =  BehaviorSubject<bool>.seeded(false);
  Stream<bool> get isLoading =>_blcisLoading.stream;


  BehaviorSubject<List<Has>> _blcListaChads = BehaviorSubject<List<Has>>.seeded(<Has>[]);
  Stream<List<Has>> get listaAvaliacaoPaciente => _blcListaChads.stream;

  void dispose(){
    _blcisLoading.close();
    _blcListaChads.close();
  }

  Future<int> cadChads({required Has avaliacao,required void Function() onSuccess, required void Function() onFail}) async{

    _blcisLoading.add(true);
    var response = await http.post(
      Uri.parse("${Utils.server_path}/scores/cadHas.php"),
      body: json.encode(avaliacao.toJson()),
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


  Future<int> getChads({required String idUser}) async{
    _blcisLoading.add(true);
    List<Has> avaliacoes = <Has>[];
    var response = await http.post(
      Uri.parse("${Utils.server_path}/scores/getHasPaciente.php"),
      body: json.encode({'idPaciente':idUser}),
      headers: {'Content-Type': 'application/json'},
    );
    print(response.body);
    List<dynamic> mapa = jsonDecode(response.body);
    mapa.forEach((avaliacao) {
      avaliacoes.add(Has(
        id: avaliacao['id'],
        valor: avaliacao['valor'],
        obs: avaliacao['obs'],
        idPaciente: idUser,
        data: avaliacao['data'],

      ),
      );
    });
    _blcListaChads.add(avaliacoes);
    _blcisLoading.add(false);
    return avaliacoes.length - 1;
  }







}