import 'package:cuidados_fibrilacao_atrial/data/exame.dart';
import 'package:cuidados_fibrilacao_atrial/data/medicamento.dart';

class Paciente{
  late String? nome;
  late String? email;
  late String? senha;
  late int? genero;
  late List<MedicamentoPaciente>? listaMedicamentos;
  late Exame? ultimoExame;

  Paciente({this.nome, this.email, this.senha, this.genero,this.listaMedicamentos,this.ultimoExame});

}