class Medicamento{
  late int? id;
  late String? nome;
  late num? dose;

  Medicamento({this.id, this.nome, this.dose});
}

class MedicamentoPaciente{
  late int? id;
  late Medicamento? medicamento;
  late int? frequencia;
  late num? dose;
  late int? data;
  late int? idPaciente;
  late num? dose_tomada;
  late String? nome_medico;
  MedicamentoPaciente(
      {this.id,
      this.medicamento,
      this.frequencia,
      this.dose,
      this.data,
      this.idPaciente,
      this.dose_tomada,
      this.nome_medico});
}
class MedicamentoTomado{
  late int? frequencia_tomada;
  late int? data;

  MedicamentoTomado({this.frequencia_tomada, this.data});
}

class HistoricoMedicamentoTomado{
  late MedicamentoPaciente? medicamentoPaciente;
  late List<MedicamentoTomado>? medicamentoTomado;

  HistoricoMedicamentoTomado(
      {this.medicamentoPaciente, this.medicamentoTomado});
}