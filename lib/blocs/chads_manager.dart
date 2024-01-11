import 'package:cuidados_fibrilacao_atrial/data/chads.dart';
import 'package:cuidados_fibrilacao_atrial/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:rxdart/rxdart.dart';
class ChadsManager{

  BehaviorSubject<bool> _blcisLoading =  BehaviorSubject<bool>.seeded(false);
  Stream<bool> get isLoading =>_blcisLoading.stream;


  BehaviorSubject<List<Chads>> _blcListaChads = BehaviorSubject<List<Chads>>.seeded(<Chads>[]);
  Stream<List<Chads>> get listaAvaliacaoPaciente => _blcListaChads.stream;

  void dispose(){
    _blcisLoading.close();
    _blcListaChads.close();
  }

  Future<int> cadChads({required Chads avaliacao,required void Function() onSuccess, required void Function() onFail}) async{

    _blcisLoading.add(true);
    var response = await http.post(
      Uri.parse("${Utils.server_path}/scores/cadChads.php"),
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
    List<Chads> avaliacoes = <Chads>[];
    var response = await http.post(
      Uri.parse("${Utils.server_path}/scores/getChadsPaciente.php"),
      body: json.encode({'idPaciente':idUser}),
      headers: {'Content-Type': 'application/json'},
    );
    print(response.body);
    List<dynamic> mapa = jsonDecode(response.body);
    mapa.forEach((avaliacao) {
      avaliacoes.add(Chads(
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