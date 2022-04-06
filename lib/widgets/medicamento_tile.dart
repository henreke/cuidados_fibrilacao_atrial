import 'package:flutter/material.dart';

class MedicamentosTile extends StatefulWidget {

  late String? nome;
  late int? data;
  late int? dose;
  late int? frequencia;

  MedicamentosTile({Key? key,this.nome, this.data, this.dose, this.frequencia}) : super(key: key);



  @override
  State<MedicamentosTile> createState() => _MedicamentosTileState();
}

class _MedicamentosTileState extends State<MedicamentosTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Text('Medicamento: ${widget.nome}'),
          Text('Data de início: ${widget.data}'),
          Text('Dose: ${widget.dose}'),
          Text('${widget.frequencia} vezes ao dia.')
        ],
      ),
    );
  }
}

