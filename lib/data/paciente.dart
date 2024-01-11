import 'package:cuidados_fibrilacao_atrial/data/avaliacao.dart';
import 'package:cuidados_fibrilacao_atrial/data/exame.dart';
import 'package:cuidados_fibrilacao_atrial/data/medicamento.dart';

class Paciente{
  late String? uid;
  late String? nome;
  late String? email;
  late String? senha;
  late int? genero;
  late List<MedicamentoPaciente>? listaMedicamentos;
  late Exame? ultimoExame;
  late int? dtnascimento;
  late int? data_ultima_prescricao;
  late Avaliacao? avaliacao;
  late String? ttr;
  late int? indicacao_anti;
  late int? indicacao_data;
  late String? medicamento;
  Paciente({this.uid,this.nome, this.email, this.senha, this.genero,this.listaMedicamentos,this.ultimoExame,this.dtnascimento,this.data_ultima_prescricao,this.avaliacao,this.ttr,this.indicacao_anti = 0,this.indicacao_data = 0, this.medicamento = ''});

}