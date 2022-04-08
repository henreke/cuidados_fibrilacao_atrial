import 'package:cuidados_fibrilacao_atrial/utils/utils.dart';
import 'package:flutter/material.dart';

class MedicamentosTile extends StatefulWidget {

  late String? nome;
  late String? nome_medico;
  late int? data;
  late int? dose;
  late int? frequencia;
  late int? dose_tomadas;
  late void Function() tomarMedicacao;
  MedicamentosTile({Key? key,this.nome, this.data, this.dose, this.frequencia,this.dose_tomadas,required this.tomarMedicacao,required this.nome_medico}) : super(key: key);



  @override
  State<MedicamentosTile> createState() => _MedicamentosTileState();
}

class _MedicamentosTileState extends State<MedicamentosTile> {
  @override
  Widget build(BuildContext context) {
    bool faltaTomar = (widget.frequencia! - widget.dose_tomadas!) > 0;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width-160,
                    child: Text('Medicamento:\n${widget.nome}')
                ),

                Text('${widget.frequencia} vezes ao dia.')
              ],
            ),
            const SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Data de início: ${Utils.epochToString(widget.data!)}'),
                Text('Dose: ${widget.dose}mg'),
              ],
            ),
            const SizedBox(height: 8,),
            Text('Prescrito por:\n${widget.nome_medico ?? ''}'),
            const SizedBox(height: 8,),
            Text(faltaTomar ? 'Ainda faltam ${widget.frequencia! - widget.dose_tomadas!} hoje.' : 'Parabéns você já tomou sua medicação completa hoje'),
            if (faltaTomar)TextButton(onPressed: ()=>widget.tomarMedicacao(), child: const Text('Tomei minha medicação')),
          ],
        ),
      ),
    );
  }
}

