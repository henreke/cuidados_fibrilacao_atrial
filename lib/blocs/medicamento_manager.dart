import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cuidados_fibrilacao_atrial/data/medicamento.dart';
import 'package:cuidados_fibrilacao_atrial/utils/utils.dart';
import 'package:rxdart/rxdart.dart';

class MedicamentoManager{


  BehaviorSubject<List<MedicamentoPaciente>> _blcMedicamentosPaciente =  BehaviorSubject<List<MedicamentoPaciente>>.seeded(<MedicamentoPaciente>[]);
  Stream<List<MedicamentoPaciente>> get listMedicamentosPaciente=>_blcMedicamentosPaciente.stream;

  void dispose(){
    _blcMedicamentosPaciente.close();
  }

  Future<List<Medicamento>> getMedicamentos() async{
    List<Medicamento> lista = <Medicamento>[];
    var response = await http.post(
      Uri.parse("${Utils.server_path}/medicamentos/getAll.php"),
      body: json.encode({'id':0}),
      headers: {'Content-Type': 'application/json'},
    );
    List<dynamic> mapa = jsonDecode(response.body);
    mapa.forEach((medicamento) {
      lista.add(Medicamento(id: medicamento['id'], nome: medicamento['nome'], dose: medicamento['dose']));
    });

    return lista;
  }

  Future<List<MedicamentoPaciente>> getMedicamentosPacienteAtual({required String idPaciente}) async{
    List<MedicamentoPaciente> lista = <MedicamentoPaciente>[];
    var response = await http.post(
      Uri.parse("${Utils.server_path}/medicamentos/getMedicamentosPacienteAtual.php"),
      body: json.encode({'idPaciente':idPaciente}),
      headers: {'Content-Type': 'application/json'},
    );

    List<dynamic> mapa = jsonDecode(response.body);


    mapa.forEach((medicamento) {
      lista.add(MedicamentoPaciente(id: medicamento['id'],
          dose: medicamento['dose'],
          data: medicamento['data'],
          dose_tomada: medicamento['dose_tomada'],
          frequencia: medicamento['frequencia'],
      nome_medico: medicamento['medico'],
      medicamento: Medicamento(nome: medicamento['nome'],dose: medicamento['dose'])));
    });
    _blcMedicamentosPaciente.add(lista);
    return lista;
  }

  Future<int> tomarMedicacao({required int idMedicamentoPaciente, required String idPaciente,required void Function() onSuccess, required void Function() onFail}) async{

    var response = await http.post(
      Uri.parse("${Utils.server_path}/medicamentos/tomarMedicamento.php"),
      body: json.encode({'idMedicamentoPaciente':idMedicamentoPaciente,'idPaciente':idPaciente}),
      headers: {'Content-Type': 'application/json'},
    );
    var mapa = jsonDecode(response.body);

    if (mapa['success'] == 1){
      onSuccess();
      return 1;
    }
    onFail();
    return 0;
  }

  Future<int> alterarMedicacao({required int idMedicamento,required int dose, required String idPaciente,required String idUser,required void Function() onSuccess, required void Function() onFail}) async{

    var response = await http.post(
      Uri.parse("${Utils.server_path}/medicamentos/alterarMedicamento.php"),
      body: json.encode({
        'idMedicamento':idMedicamento,
        'idPaciente':idPaciente,
        'dose':dose,
        'idUser':idUser
      }),
      headers: {'Content-Type': 'application/json'},
    );
    var mapa = jsonDecode(response.body);

    if (mapa['success'] == 1){
      onSuccess();
      return 1;
    }
    onFail();
    return 0;
  }

}