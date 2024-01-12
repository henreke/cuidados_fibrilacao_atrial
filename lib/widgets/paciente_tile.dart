import 'dart:convert';

import 'package:cuidados_fibrilacao_atrial/blocs/paciente_manager.dart';
import 'package:cuidados_fibrilacao_atrial/data/paciente.dart';
import 'package:cuidados_fibrilacao_atrial/screens/autoavaliacao_screen.dart';
import 'package:cuidados_fibrilacao_atrial/screens/autoavaliacao_screen_view.dart';
import 'package:cuidados_fibrilacao_atrial/screens/chart_screen_equipe.dart';
import 'package:cuidados_fibrilacao_atrial/screens/chat_enfermagem.dart';
import 'package:cuidados_fibrilacao_atrial/screens/escore_chads_screen.dart';
import 'package:cuidados_fibrilacao_atrial/screens/escore_chads_screen_view.dart';
import 'package:cuidados_fibrilacao_atrial/screens/escore_has_screen.dart';
import 'package:cuidados_fibrilacao_atrial/screens/escore_has_screen_view.dart';
import 'package:cuidados_fibrilacao_atrial/screens/historico_exames.dart';
import 'package:cuidados_fibrilacao_atrial/screens/historico_exames2.dart';
import 'package:cuidados_fibrilacao_atrial/screens/historico_exames3.dart';
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
                  const Text('Paciente:',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  Text('Idade: ${Utils.idadeFromEpoch(paciente!.dtnascimento!)}'),
                  //Image.memory(base64Decode(paciente!.ultimoExame!.foto!)),
                ],
              ),
              const SizedBox(height: 8,),
              Text(paciente!.nome ?? '',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              const SizedBox(height: 8,),
              const Padding(
                padding: EdgeInsets.only(left: 8.0,right: 8.0),
                child: Divider(color: Colors.black,height: 8,),
              ),
              const SizedBox(height: 6,),
              const Text('Resultado do Último Exame do Índice Normalizado Internacional (INR):'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Valor: ${paciente!.ultimoExame?.valor == 0 ? 'Sem valor cadastrado' : paciente!.ultimoExame?.valor}'),

                  Text('Data: ${paciente!.ultimoExame!.data! == 0 ? '--------------' :Utils.epochToString(paciente!.ultimoExame!.data!)}'),
                ],
              ),
              const SizedBox(height: 8,),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Text('Indicação da Anticoagulação: '),
                    ComboIndicacao(
                      valueSetter: (value) {
                        paciente!.indicacao_anti = value;
                        PacienteManager _paciente_manager = PacienteManager();
                        _paciente_manager.updateIndicacao(
                            idUser: paciente!.uid!,
                            indicacao: paciente!.indicacao_anti!,
                            onSuccess: (){},
                            onFail: (){});
                      },
                      sim: paciente!.indicacao_anti!,
                    ),
                  ],
                ),
              ),
              if (paciente!.indicacao_data! != 0)Text("Data de Início da Anticoagulação: ${Utils.epochToString(paciente!.indicacao_data!)}"),
              const SizedBox(height: 8,),
              const Text('Tempo de Intervalo Terapêutico (TTR):'),
              Text('${paciente!.ttr!}%'),
              const SizedBox(height: 4,),


              const SizedBox(height: 4,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Última Dose Prescrita:'),

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
              const SizedBox(height: 8,),

              const SizedBox(height: 4,),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    TextButton(onPressed: paciente!.ultimoExame!.data == 0 ? null : ()=>visualizarExame(), child: Text('Visualizar Exame')),
                    Text("  Medicações em Uso: ${paciente!.medicamento}"),
                    TextButton(onPressed: ()=>alterarMedicacao(), child: Text('Alterar Medicações (Segunda a Domingo)')),
                  ],
                ),
              ),
              const SizedBox(height: 8,),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    TextButton(onPressed: ()=>marcarVisto(), child: Text('Marcar como Visto')),
                    TextButton(onPressed: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>AutoAvaliacaoScreenView(idPaciente: paciente!.uid!,))), child: const Text('Visualizar Auto Avaliação Semanal'))
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    TextButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreenSaude(paciente: paciente!,))), child: Text('Enviar Orientações Médicas')),
                    TextButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreenEnfermagem(paciente: paciente!,))), child: Text('Enviar Orientações de Enfermagem')),
                    TextButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>HistoricoMedicacoesScreen(paciente: paciente!,))), child: Text('Histórico de Adesão ao Tratamento Medicamentoso')),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>HistoricoExamesScreen3(paciente: paciente,))),
                      child: Text(
                        'Histórico do Resultado do Exame INR\n(Deve estar entre os valores 2 e 3)',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,)),

                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    TextButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>EscoreChadScreen(idPaciente: paciente!.uid!,))), child: Text('Ferramenta CHA2DS2-VASc')),
                    TextButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>EscoreChadScreenView(idPaciente: paciente!.uid!,))), child: Text('Histórico Ferramenta CHA2DS2-VASc')),

                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    TextButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>EscoreHasBledScreen(idPaciente: paciente!.uid!,))), child: Text('Ferramenta HAS-BLED')),
                    TextButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>EscoreHasBledScreenView(idPaciente: paciente!.uid!,))), child: Text('Histórico Ferramenta HAS-BLED')),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ComboIndicacao extends StatefulWidget {
  ComboIndicacao({Key? key,required this.valueSetter, required this.sim}) : super(key: key);
  final ValueSetter valueSetter;
  int sim;
  @override
  State<ComboIndicacao> createState() => _ComboIndicacaoState();
}

class _ComboIndicacaoState extends State<ComboIndicacao> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: widget.sim,
      onChanged: (value){
        widget.valueSetter(value!);
        setState(() {
          widget.sim = value!;
        });
      },
      items: [
        DropdownMenuItem<int>(child: Text("Sim"),value: 1,),
        DropdownMenuItem<int>(child: Text("Não"),value: 0,),
      ],
    );
  }
}

