import 'package:cuidados_fibrilacao_atrial/data/exame.dart';
import 'package:cuidados_fibrilacao_atrial/data/paciente.dart';
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
      print(exames);
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
      lista.add(
          Paciente(
              uid: paciente['idPaciente'],
              dtnascimento: paciente['dtnascimento'],
              nome: paciente['nome'],
              ultimoExame: exame,
              listaMedicamentos: paciente['listaMedicamentos'],
              data_ultima_prescricao: paciente['data_ultima_prescricao'] ?? 0
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