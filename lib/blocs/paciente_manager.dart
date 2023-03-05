import 'package:cuidados_fibrilacao_atrial/data/avaliacao.dart';
import 'package:cuidados_fibrilacao_atrial/data/exame.dart';
import 'package:cuidados_fibrilacao_atrial/data/paciente.dart';
import 'package:cuidados_fibrilacao_atrial/data/perguntas.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'package:cuidados_fibrilacao_atrial/utils/utils.dart';
import 'dart:convert';
class PacienteManager{

  BehaviorSubject<bool> _blcisLoading =  BehaviorSubject<bool>.seeded(false);
  Stream<bool> get isLoading =>_blcisLoading.stream;

  BehaviorSubject<List<Paciente>> _blcPacienteCentroMedico =  BehaviorSubject<List<Paciente>>.seeded(<Paciente>[]);
  Stream<List<Paciente>> get listPacienteCentroMedico=>_blcPacienteCentroMedico.stream;

  void dispose(){
    _blcPacienteCentroMedico.close();
    _blcisLoading.close();
  }

  Future<void> getPacientesCentroMedico({required int idCentroMedico}) async{
    _blcisLoading.add(true);
    List<Paciente> lista = <Paciente>[];
    var response = await http.post(
      Uri.parse("${Utils.server_path}/pacientes/getPacienteCentroMedico.php"),
      body: json.encode({'idCentroMedico':idCentroMedico}),
      headers: {'Content-Type': 'application/json'},
    );
    //print(response.body);
    List<dynamic> mapa = jsonDecode(response.body);
    mapa.forEach((paciente) {
      Exame exame = Exame(valor: 0,foto: '',data: 0);
      String exames = paciente['exameJson'] ?? '';
      exames = exames.replaceAll("'", "\"");

      if (exames.isNotEmpty) {
        Map<String, dynamic> exameMapa = jsonDecode(exames);

        if (exameMapa.isNotEmpty) {
          exame.valor = exameMapa['valor'];
          exame.data = exameMapa['data'];
          exame.foto = paciente['base64'];
          exame.tratado = exameMapa['tratado'];
          exame.id = exameMapa['idExame'];
        }
      }
      Avaliacao _avaliacao = Avaliacao(data: 0,idPaciente: '',perguntas: []);
      String avaliacoes = paciente['avaliacaoJson'] ?? '';
      print(avaliacoes);
      avaliacoes = avaliacoes.replaceAll("'", "\"");

      if (avaliacoes.isNotEmpty){
        Map<String,dynamic> avaliacaoMapa = jsonDecode(avaliacoes);
        _avaliacao.data = avaliacaoMapa['data'];
        for (int i = 1; i < 11; i++) {
          _avaliacao.respostas.add(avaliacaoMapa["perg$i"]);
        }

      }
      lista.add(
          Paciente(
              uid: paciente['idPaciente'],
              dtnascimento: paciente['dtnascimento'],
              nome: paciente['nome'],
              ultimoExame: exame,
              listaMedicamentos: paciente['listaMedicamentos'],
              data_ultima_prescricao: paciente['data_ultima_prescricao'] ?? 0,
              avaliacao: _avaliacao
          )
      );
    });

    _blcPacienteCentroMedico.add(lista);
    _blcisLoading.add(false);
  }

  void refreshListaPacientes(List<Paciente> lista){
      _blcPacienteCentroMedico.add(lista);
  }
}