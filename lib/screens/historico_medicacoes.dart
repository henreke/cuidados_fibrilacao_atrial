import 'package:cuidados_fibrilacao_atrial/blocs/medicamento_manager.dart';
import 'package:cuidados_fibrilacao_atrial/data/medicamento.dart';
import 'package:cuidados_fibrilacao_atrial/data/paciente.dart';
import 'package:flutter/material.dart';

class HistoricoMedicacoesScreen extends StatefulWidget {
  final Paciente? paciente;
  const HistoricoMedicacoesScreen({Key? key, this.paciente}) : super(key: key);

  @override
  State<HistoricoMedicacoesScreen> createState() =>
      _HistoricoMedicacoesScreenState();
}

class _HistoricoMedicacoesScreenState extends State<HistoricoMedicacoesScreen> {

  MedicamentoManager _medicamentoManager = MedicamentoManager();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.paciente!.nome}"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children:
            gerarLista(),

        ),
      ),
    );
  }

  List<Widget> gerarHistorico() {
    List<Widget> saida = <Widget>[];
    for (var i = 0; i < 55; i++) {
      saida.add(SizedBox(
        width: 30,
        height: 30,
        child: Container(
          color: Colors.red,
        ),
      ));
      //saida.add(SizedBox(width: 5,));
    }
    return saida;
  }

  List<Widget> gerarLista() {
    List<MedicamentoPaciente> lista;
    List<Widget> saida = <Widget>[];
    saida.add(Row(
      children: [
        TextButton(onPressed: () async{
            int datai = DateTime.now().add((const Duration(days: -7))).millisecondsSinceEpoch;
            int dataf = DateTime.now().millisecondsSinceEpoch;
            List<int> datas = <int>[];

            lista = await _medicamentoManager.getMedicamentosHistoricoPaciente(idPaciente: widget.paciente!.uid!, datai: datai, dataf: dataf);
            DateTime data_aux = DateTime.now().add(const Duration(days: -7));
            DateTime data_aux2 = DateTime.now().add(const Duration(days: -6));
            for (int dt = 0; dt < 7;dt++){

                DateTime dataTemp = DateTime(data_aux.year,data_aux.month,data_aux.day);
                DateTime dataTemp2 = DateTime(data_aux2.year,data_aux2.month,data_aux2.day);
                bool condicao = lista.isNotEmpty;
                int indice = 0;
                while (condicao){
                  if (lista[indice].data! < dataTemp2.millisecondsSinceEpoch && lista[indice].data! > dataTemp.millisecondsSinceEpoch){

                  }
                }
                print("Data ${dataTemp}");
                data_aux = data_aux2;
                data_aux2 = data_aux2.add(const Duration(days: 1));
            }
        }, child: Text('Útimos 7 dias')),
        TextButton(onPressed: () {}, child: Text('Útimos 14 dias')),
        TextButton(onPressed: () {}, child: Text('Útimos 30 dias')),
      ],
    ));

    saida.add(
      Wrap(
        children: gerarHistorico(),
        spacing: 5,
        runSpacing: 5,
        alignment: WrapAlignment.center,
      ),
    );
    return saida;
  }
}
