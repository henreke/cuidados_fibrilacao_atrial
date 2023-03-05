import 'package:cuidados_fibrilacao_atrial/data/avaliacao.dart';
import 'package:flutter/material.dart';

class ResultadoAvaliacaoScreen extends StatelessWidget {
  Avaliacao avaliacao;
  ResultadoAvaliacaoScreen({Key? key,required this.avaliacao}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    avaliacao.perguntas = Avaliacao.perguntas_const;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Auto-Avaliação"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: avaliacao.respostas.length,
          itemBuilder: (context,i){
        return Card(
          margin: EdgeInsets.only(left: 8,right: 8,top: 8),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('${avaliacao.perguntas[i].titulo}  ${(avaliacao.perguntas[i].respostas[avaliacao.respostas[i]])}'),
          ),
        );
      }),
    );
  }
}