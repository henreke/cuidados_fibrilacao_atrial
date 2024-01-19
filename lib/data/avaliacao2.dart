import 'package:cuidados_fibrilacao_atrial/data/perguntas.dart';

class Avaliacao2 {
  String idPaciente = '';
  int data = 0;
  int sangramento = -1;
  int manchas = -1;
  int urgencia = -1;
  int nova_medicacao = -1;
  int alimentacao = -1;
  int acrescimo_medicacao = -1;
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
        'perg1': this.sangramento == -1 ? 0 : this.sangramento,
        'perg2': this.manchas == -1 ? 0 : this.manchas,
        'perg3': this.urgencia == -1 ? 0 : this.urgencia,
        'perg4': this.nova_medicacao == -1 ? 0 : this.nova_medicacao,
        'perg5': this.alimentacao == -1 ? 0 : this.alimentacao,
        'perg6': this.acrescimo_medicacao == -1 ? 0 : this.acrescimo_medicacao,
        'perg1_txt': this.sangramento_txt.toString(),
        'perg2_txt': this.manchas_escolha,
        'perg3_txt': this.urgencia_txt,
        'perg4_txt': this.novaMedicacao_txt,
        'perg5_txt': this.alimentacao_txt,
        'perg6_txt': this.acrescimoMedicacao_txt,
      };
}
