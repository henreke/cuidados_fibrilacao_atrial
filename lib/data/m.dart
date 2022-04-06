class Medicamento{
  late int? id;
  late String? nome;
  late int? dose;

  Medicamento({this.id, this.nome, this.dose});
}

class MedicamentoPaciente{
  late int? id;
  late Medicamento? medicamento;
  late int? frequencia;
  late int? dose;
  late int? data;
  late int? idPaciente;

  MedicamentoPaciente(
      {this.id,
      this.medicamento,
      this.frequencia,
      this.dose,
      this.data,
      this.idPaciente});
}