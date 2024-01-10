import 'package:cuidados_fibrilacao_atrial/data/perguntas.dart';

class Avaliacao2 {
  String idPaciente = '';
  int data = 0;
  bool sangramento = false;
  bool manchas = false;
  bool urgencia = false;
  bool nova_medicacao = false;
  bool alimentacao = false;
  bool acrescimo_medicacao = false;
  int manchas_escolha = 0;
  String sangramento_txt = '';
  String urgencia_txt = '';
  String novaMedicacao_txt = '';
  String alimentacao_txt = '';
  String acrescimoMedicacao_txt = '';

  Avaliacao2(
      {required this.idPaciente,
      this.data = 0,
      required this.sangramento,
      required this.manchas,
      required this.urgencia,
      required this.nova_medicacao,
      required this.alimentacao,
      required this.acrescimo_medicacao,
      required this.manchas_escolha,
      required this.sangramento_txt,
      required this.urgencia_txt,
      required this.novaMedicacao_txt,
      required this.alimentacao_txt,
      required this.acrescimoMedicacao_txt});

  toJson() => {
        'idPaciente': this.idPaciente,
        'perg1': this.sangramento ? 1 : 0,
        'perg2': this.manchas ? 1 : 0,
        'perg3': this.urgencia ? 1 : 0,
        'perg4': this.nova_medicacao ? 1 : 0,
        'perg5': this.alimentacao ? 1 : 0,
        'perg6': this.acrescimo_medicacao ? 1 : 0,
        'perg1_txt': this.sangramento_txt.toString(),
        'perg2_txt': this.manchas_escolha.toString(),
        'perg3_txt': this.urgencia_txt,
        'perg4_txt': this.novaMedicacao_txt,
        'perg5_txt': this.alimentacao_txt,
        'perg6_txt': this.acrescimoMedicacao_txt,
      };
}
