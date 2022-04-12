import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cuidados_fibrilacao_atrial/data/medicamento.dart';
import 'package:cuidados_fibrilacao_atrial/utils/utils.dart';
import 'package:rxdart/rxdart.dart';

class MedicamentoManager{


  BehaviorSubject<List<MedicamentoPaciente>> _blcMedicamentosPaciente =  BehaviorSubject<List<MedicamentoPaciente>>.seeded(<MedicamentoPaciente>[]);
  Stream<List<MedicamentoPaciente>> get listMedicamentosPaciente=>_blcMedicamentosPaciente.stream;
  BehaviorSubject<bool> _blcisLoading =  BehaviorSubject<bool>.seeded(false);
  Stream<bool> get isLoading =>_blcisLoading.stream;

  BehaviorSubject<List<Medicamento>> _blcMedicamentoList = BehaviorSubject<List<Medicamento>>.seeded(<Medicamento>[]);
  Stream<List<Medicamento>> get listMedicamentos => _blcMedicamentoList.stream;
  void dispose(){
    _blcMedicamentosPaciente.close();
    _blcisLoading.close();
    _blcMedicamentoList.close();
  }

  Future<List<Medicamento>> getMedicamentos() async{
    _blcisLoading.add(true);
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
    _blcMedicamentoList.add(lista);
    _blcisLoading.add(false);
    return lista;
  }

  Future<List<MedicamentoPaciente>> getMedicamentosPacienteAtual({required String idPaciente}) async{
    _blcisLoading.add(true);
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
      medicamento: Medicamento(id: medicamento['idMedicamento'],nome: medicamento['nome'],dose: medicamento['dose'])));
    });
    _blcMedicamentosPaciente.add(lista);
    _blcisLoading.add(false);
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

  Future<int> alterarMedicacao({int? idMedicamentoPacienteAnterior, required int idMedicamento,required int dose, required int frequencia, required String idPaciente,required String idUser,required void Function() onSuccess, required void Function() onFail}) async{

    _blcisLoading.add(true);
    var response = await http.post(
      Uri.parse("${Utils.server_path}/medicamentos/alterarMedicamento.php"),
      body: json.encode({
        'idMedicamento':idMedicamento,
        'idPaciente':idPaciente,
        'dose':dose,
        'frequencia':frequencia,
        'idUser':idUser,
        'idMedicamentoPacienteAnterior': idMedicamentoPacienteAnterior ?? 0
      }),
      headers: {'Content-Type': 'application/json'},
    );

    var mapa = jsonDecode(response.body);
    _blcisLoading.add(false);
    if (mapa['success'] == 1){
      onSuccess();
      return 1;
    }
    onFail();
    return 0;
  }

}