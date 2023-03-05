import 'dart:convert';

import 'package:cuidados_fibrilacao_atrial/data/paciente.dart';
import 'package:cuidados_fibrilacao_atrial/screens/autoavaliacao_screen.dart';
import 'package:cuidados_fibrilacao_atrial/screens/chart_screen_equipe.dart';
import 'package:cuidados_fibrilacao_atrial/screens/historico_exames.dart';
import 'package:cuidados_fibrilacao_atrial/screens/historico_exames2.dart';
import 'package:cuidados_fibrilacao_atrial/screens/historico_medicacoes.dart';
import 'package:cuidados_fibrilacao_atrial/screens/resultado_avaliacao_screen.dart';
import 'package:cuidados_fibrilacao_atrial/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
class PacienteTile extends StatelessWidget {

  final Paciente? paciente;
  final void Function() visualizarExame;
  final void Function() alterarMedicacao;
  final void Function() marcarVisto;
  const PacienteTile({this.paciente,required this.alterarMedicacao,required this.marcarVisto,required this.visualizarExame,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Badge(
      badgeContent: const Icon(Icons.dangerous),
      showBadge: ((paciente!.ultimoExame!.valor! > Utils.valorExameAlto || paciente!.ultimoExame!.valor! < Utils.valorExameBaixo) && paciente!.ultimoExame!.tratado == 0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8,),
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

                  Text('Data: ${paciente!.ultimoExame!.data! == 0 ? '--------------' :Utils.epochToString(paciente!.ultimoExame!.data!)}'),
                ],
              ),
              const SizedBox(height: 4,),

              Text('Valor: ${paciente!.ultimoExame?.valor == 0 ? 'Sem valor cadastrado' : paciente!.ultimoExame?.valor}'),
              const SizedBox(height: 4,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Última dose prescrição:'),

                  Text('Data: ${paciente!.data_ultima_prescricao! == 0 ? '--------------' : Utils.epochToString(paciente!.data_ultima_prescricao!)}'),
                ],
              ),
              const SizedBox(height: 4,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Última Auto-Avaliação:'),
                  Text('Data: ${(paciente!.avaliacao?.data ?? 0) == 0 ? '--------------' : Utils.epochToString(paciente!.avaliacao!.data)}'),
                ],
              ),
              const SizedBox(height: 4,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(onPressed: paciente!.ultimoExame!.data == 0 ? null : ()=>visualizarExame(), child: Text('Visualizar Exame')),
                  TextButton(onPressed: ()=>alterarMedicacao(), child: Text('Alterar Medicação')),
                ],
              ),
              const SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(onPressed: ()=>marcarVisto(), child: Text('Marcar como Visto')),
                  TextButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>HistoricoExamesScreen2(paciente: paciente,))), child: Text('Histórico de Exames')),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreenSaude(paciente: paciente!,))), child: Text('Enviar Orientações')),
                  TextButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>HistoricoMedicacoesScreen(paciente: paciente!,))), child: Text('Histórico Medicações')),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(onPressed: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>ResultadoAvaliacaoScreen(avaliacao: paciente!.avaliacao!,))), child: const Text('Visualizar Auto-Avaliação'))
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}

