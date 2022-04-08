import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cuidados_fibrilacao_atrial/data/centro_medico.dart';
import 'package:cuidados_fibrilacao_atrial/utils/utils.dart';

class CentroMedicoManager{

  Future<List<CentroMedico>> getAll() async{
    List<CentroMedico> lista = <CentroMedico>[];
    var response = await http.post(
      Uri.parse("${Utils.server_path}/centro_medico/getAll.php"),
      body: json.encode({}),
      headers: {'Content-Type': 'application/json'},
    );
    List<dynamic> mapa = jsonDecode(response.body);
    mapa.forEach((centro)=>lista.add(CentroMedico(id: centro["id"],nome: centro['nome'])));
    return lista;
  }


}