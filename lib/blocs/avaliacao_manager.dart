import 'package:cuidados_fibrilacao_atrial/data/exame.dart';
import 'package:cuidados_fibrilacao_atrial/utils/utils.dart';
import 'package:cuidados_fibrilacao_atrial/data/avaliacao.dart';
import 'package:cuidados_fibrilacao_atrial/data/avaliacao2.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:rxdart/rxdart.dart';
class AvaliacaoManager{

  BehaviorSubject<bool> _blcisLoading =  BehaviorSubject<bool>.seeded(false);
  Stream<bool> get isLoading =>_blcisLoading.stream;

  BehaviorSubject<List<Exame>> _blcListaExame = BehaviorSubject<List<Exame>>.seeded(<Exame>[]);
  Stream<List<Exame>> get listaExamesPaciente => _blcListaExame.stream;

  BehaviorSubject<List<Avaliacao2>> _blcListaAvaliacao = BehaviorSubject<List<Avaliacao2>>.seeded(<Avaliacao2>[]);
  Stream<List<Avaliacao2>> get listaAvaliacaoPaciente => _blcListaAvaliacao.stream;

  void dispose(){
    _blcisLoading.close();
    _blcListaExame.close();
    _blcListaAvaliacao.close();
  }

  Future<int> cadAvaliacao({required Avaliacao avaliacao,required void Function() onSuccess, required void Function() onFail}) async{

    _blcisLoading.add(true);
    var response = await http.post(
      Uri.parse("${Utils.server_path}/avaliacao/cadAvaliacao.php"),
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

  Future<int> cadAvaliacao2({required Avaliacao2 avaliacao,required void Function() onSuccess, required void Function() onFail}) async{

    _blcisLoading.add(true);

    var response = await http.post(
      Uri.parse("${Utils.server_path}/avaliacao/cadAvaliacao2.php"),
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
  Future<int> getAvaliacao2({required String idUser}) async{
    _blcisLoading.add(true);
    List<Avaliacao2> avaliacoes = <Avaliacao2>[];
    var response = await http.post(
      Uri.parse("${Utils.server_path}/avaliacao/getAvaliacaoUser.php"),
      body: json.encode({'idPaciente':idUser}),
      headers: {'Content-Type': 'application/json'},
    );
    List<dynamic> mapa = jsonDecode(response.body);
    mapa.forEach((avaliacao) {
      avaliacoes.add(Avaliacao2(
          sangramento: avaliacao['perg1'],
          sangramento_txt: avaliacao['perg1_txt'],
          manchas: avaliacao['perg2'],
          manchas_escolha: avaliacao['perg2_txt'],
          urgencia: avaliacao['perg3'],
          urgencia_txt: avaliacao['perg3_txt'],
          nova_medicacao: avaliacao['perg4'],
          novaMedicacao_txt: avaliacao['perg4_txt'],
          alimentacao: avaliacao['perg5'],
          alimentacao_txt: avaliacao['perg5_txt'],
          acrescimo_medicacao: avaliacao['perg6'],
          acrescimoMedicacao_txt: avaliacao['perg6_txt'],
          idPaciente: idUser,
          data: avaliacao['data'],

      ),
      );
    });
    _blcListaAvaliacao.add(avaliacoes);
    _blcisLoading.add(false);
    return avaliacoes.length - 1;
  }
  Future<int> updateValorExame({required Exame exame, required String idUser,required void Function() onSuccess, required void Function() onFail}) async{
    _blcisLoading.add(true);
    var response = await http.post(
      Uri.parse("${Utils.server_path}/exames/updateValorExame.php"),
      body: json.encode({'idExame':exame.id,'valor':exame.valor,'idUser':idUser}),
      headers: {'Content-Type': 'application/json'},
    );

    var mapa = jsonDecode(response.body);
    _blcisLoading.add(false);
    if (mapa['success'] == 1){
      onSuccess();
      return 1;
    } else{
      onFail();
      return 0;
    }
  }

  Future<int> marcarTratadoExame({required Exame exame, required String idUser,required void Function() onSuccess, required void Function() onFail}) async{
    _blcisLoading.add(true);
    var response = await http.post(
      Uri.parse("${Utils.server_path}/exames/marcarTratadoExame.php"),
      body: json.encode({'idExame':exame.id,'idUser':idUser}),
      headers: {'Content-Type': 'application/json'},
    );

    var mapa = jsonDecode(response.body);
    _blcisLoading.add(false);
    if (mapa['success'] == 1){
      exame.tratado = 1;
      onSuccess();
      return 1;
    } else{
      onFail();
      return 0;
    }
  }

  Future<List<Exame>> getListaExamesPaciente({required String id,required String idUser}) async{
    _blcisLoading.add(true);
    List<Exame> lista = <Exame>[];
    var response = await http.post(
      Uri.parse("${Utils.server_path}/exames/getListaExamesPaciente.php"),
      body: json.encode({'idPaciente':id,'idUser':idUser}),
      headers: {'Content-Type': 'application/json'},
    );
    List<dynamic> mapa = jsonDecode(response.body);
    mapa.forEach((exame) {
      lista.add(Exame(
          id: exame['id'],
          valor: exame['valor'],
          tratado: exame['tratado'],
          data: exame['data'],
          data_tratado: exame['data_tratado']
      ),
      );
    });
    _blcisLoading.add(false);
    _blcListaExame.add(lista);
    return lista;
  }

  Future<void> getParamExame() async{
    var response = await http.post(
      Uri.parse("${Utils.server_path}/exames/getParamValorExame.php"),
      body: json.encode('{}'),
      headers: {'Content-Type': 'application/json'},
    );
    Map<String,dynamic> mapa = jsonDecode(response.body);
    Utils.valorExameAlto = mapa['alto'];
    Utils.valorExameBaixo = mapa['baixo'];
  }
}