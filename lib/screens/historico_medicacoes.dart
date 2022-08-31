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
    List<HistoricoMedicamentoTomado> lista;
    List<Widget> saida = <Widget>[];
    saida.add(Row(
      children: [
        TextButton(onPressed: () async{
            int datai = (DateTime.now().add((const Duration(days: -7))).millisecondsSinceEpoch/1000).round();
            int dataf = (DateTime.now().millisecondsSinceEpoch/1000).round();
            List<int> datas = <int>[];

            lista = await _medicamentoManager.getMedicamentosHistoricoPaciente(idPaciente: widget.paciente!.uid!, datai: datai, dataf: dataf);

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
