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
    print(response.body);
    List<dynamic> mapa = jsonDecode(response.body);
    mapa.forEach((paciente) {
      Map<String,dynamic> exameMapa =  jsonDecode((paciente['exame'] as String).replaceAll("'", '"'));
      Exame exame = Exame(valor: 0,foto: '',data: 0);
      if (exameMapa.isNotEmpty) {
        exame.valor = exameMapa['valor'];
        exame.data = exameMapa['data'];
        exame.foto = exameMapa['foto'];
      }
      lista.add(Paciente(uid: paciente['id'], nome: paciente['nome'], ultimoExame: exame,listaMedicamentos: paciente['listaMedicamentos']));
    });

    _blcPacienteCentroMedico.add(lista);
    _blcisLoading.add(false);
  }
}