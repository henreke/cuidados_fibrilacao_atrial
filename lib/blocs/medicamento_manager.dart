import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cuidados_fibrilacao_atrial/data/m.dart';
import 'package:cuidados_fibrilacao_atrial/utils/utils.dart';
import 'package:rxdart/rxdart.dart';

class MedicamentoManager{


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

}