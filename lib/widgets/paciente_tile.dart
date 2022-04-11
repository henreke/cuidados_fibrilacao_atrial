import 'dart:convert';

import 'package:cuidados_fibrilacao_atrial/data/paciente.dart';
import 'package:cuidados_fibrilacao_atrial/utils/utils.dart';
import 'package:flutter/material.dart';

class PacienteTile extends StatelessWidget {

  final Paciente? paciente;
  final void Function() visualizarExame;
  final void Function() alterarMedicacao;
  final void Function() marcarVisto;
  const PacienteTile({this.paciente,required this.alterarMedicacao,required this.marcarVisto,required this.visualizarExame,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Paciente:',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                Text('Idade: ${Utils.idadeFromEpoch(paciente!.dtnascimento!)}'),
                //Image.memory(base64Decode(paciente!.ultimoExame!.foto!)),
              ],
            ),
            const SizedBox(height: 8,),
            Text(paciente!.nome ?? '',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
            const SizedBox(height: 8,),
            const Padding(
              padding: EdgeInsets.only(left: 8.0,right: 8.0),
              child: Divider(color: Colors.black,height: 8,),
            ),
            const SizedBox(height: 6,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Último exame:'),

                Text('Data: ${Utils.epochToString(paciente!.ultimoExame!.data!)}'),
              ],
            ),
            const SizedBox(height: 4,),
            Text('Valor: ${paciente!.ultimoExame?.valor ?? 'Sem valor cadastrado'}'),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: ()=>visualizarExame(), child: Text('Visualizar Exame')),
                TextButton(onPressed: ()=>alterarMedicacao(), child: Text('Alterar Medicação')),
              ],
            ),
            const SizedBox(height: 8,),
            Center(child: TextButton(onPressed: ()=>marcarVisto(), child: Text('Marcar como Visto'))),
          ],
        ),
      ),
    );
  }
}

