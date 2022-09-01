import 'dart:ffi';

import 'package:cuidados_fibrilacao_atrial/blocs/medicamento_manager.dart';
import 'package:cuidados_fibrilacao_atrial/data/medicamento.dart';
import 'package:cuidados_fibrilacao_atrial/data/paciente.dart';
import 'package:cuidados_fibrilacao_atrial/utils/utils.dart';
import 'package:flutter/material.dart';

class HistoricoMedicacoesScreen extends StatefulWidget {
  final Paciente? paciente;
  HistoricoMedicacoesScreen({Key? key, this.paciente}) : super(key: key);

  List<Widget> listaWidgets = <Widget>[];
  @override
  State<HistoricoMedicacoesScreen> createState() =>
      _HistoricoMedicacoesScreenState();
}

class _HistoricoMedicacoesScreenState extends State<HistoricoMedicacoesScreen> {

  MedicamentoManager _medicamentoManager = MedicamentoManager();
  DateTime? datai,dataf;



  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.paciente!.nome}"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 8,right: 8),
        child: Column(
          children:[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: (){
                  consultarHistorico(dias: 7);
                }, child: Text('Útimos 7 dias')),
                TextButton(onPressed: () {
                  consultarHistorico(dias: 14);
                }, child: Text('Útimos 14 dias')),
                TextButton(onPressed: () {
                  consultarHistorico(dias: 30);
                }, child: Text('Útimos 30 dias')),
              ],
            ),
            const SizedBox(height: 8,),
            if (datai != null)Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Entre ${ Utils.dataToString(datai!)} até ${Utils.dataToString(DateTime.now())}"),
              ],
            ),
            if (datai != null)const SizedBox(height: 8,),
            Text("Legenda"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                legenda(cor: Colors.green,texto:  "Mais de 75%"),
                legenda(cor: Colors.orange,texto:  "Menos de 75%"),
                legenda(cor: Colors.red,texto:  "Menos de 25%"),
              ],
            ),
            const SizedBox(height: 8,),
            Column(
              children: widget.listaWidgets,
            ),
          ]

        ),
      ),
    );
  }
  Widget legenda({required Color cor, required String texto}){
    return Row(
      children: [
        SizedBox(
          width: 30,
          height: 30,
          child: Container(
            color: cor,
          ),
        ),
        Text(texto,style: TextStyle(color: cor),)
      ],
    );
  }
  void consultarHistorico({required int dias}) async{

    List<HistoricoMedicamentoTomado> lista;
    DateTime datai_data = DateTime.now().add((Duration(days: -dias)));
    int datai = (datai_data.millisecondsSinceEpoch/1000).round();
    int dataf = (DateTime.now().add((const Duration(days: 1))).millisecondsSinceEpoch/1000).round();
    int datai_aux = (DateTime(datai_data.year, datai_data.month, datai_data.day).millisecondsSinceEpoch/1000).round();

    this.datai = DateTime.fromMillisecondsSinceEpoch(datai*1000);

    lista = await _medicamentoManager.getMedicamentosHistoricoPaciente(idPaciente: widget.paciente!.uid!, datai: datai, dataf: dataf);

    List<Widget> widgetsHistorico = <Widget>[];

    lista.forEach((historico) {
      List<int> dia_historico = <int>[];
      int datai_aux2 = datai_aux + 86400;
      int ind_historico = 0;
      if (historico.medicamentoTomado!.length == 0){
        for (int j =0; j < dias; j++){
          dia_historico.add(0);
        }
      }else{
        for (int j = 0; j < dias; j++){
          //print("Medicacao tomada ${historico.medicamentoTomado![ind_historico].frequencia_tomada} ${j}");
          //print("Datas ${datai_aux2} data2 ${historico.medicamentoTomado![ind_historico].data}");
          if (datai_aux2 == historico.medicamentoTomado![ind_historico].data){
            //print("Medicacao tomada ${historico.medicamentoTomado![ind_historico].frequencia_tomada}");
            double perc_tomado = historico.medicamentoTomado![ind_historico].frequencia_tomada!/historico.medicamentoPaciente!.frequencia!;
            dia_historico.add(perc_tomado > 0.75 ? 3 : perc_tomado > 0.25 ? 2 : 1);
            ind_historico++;
          } else{
            dia_historico.add(0);
          }
          datai_aux2 += 86400;
        }
      }

      widgetsHistorico.addAll(gerarLista(medicacao: historico.medicamentoPaciente!.medicamento!.nome!,historico: dia_historico));
    });

    setState(() {
      widget.listaWidgets.clear();
      widget.listaWidgets.addAll(widgetsHistorico);
    });


  }
  List<Widget> gerarHistorico({required List<int> historico}) {
    List<Widget> saida = <Widget>[];
    for (var i = 0; i < historico.length; i++) {
      saida.add(SizedBox(
        width: 30,
        height: 30,
        child: Container(
          color: historico[i] < 3 ? historico[i] < 2 ? Colors.red : Colors.orange : Colors.green,
        ),
      ));
      //saida.add(SizedBox(width: 5,));
    }
    return saida;
  }

  List<Widget> gerarLista({required String medicacao,required List<int> historico}) {
    List<Widget> saida = <Widget>[];

    saida.add(Text(medicacao));
    saida.add(
      Wrap(
        children: gerarHistorico(historico: historico),
        spacing: 5,
        runSpacing: 5,
        alignment: WrapAlignment.center,
      ),
    );

    widget.listaWidgets.addAll(saida);
    return saida;
  }
}
