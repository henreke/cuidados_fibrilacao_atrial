import 'package:cuidados_fibrilacao_atrial/data/perguntas.dart';
import 'package:flutter/material.dart';

class TilePerguntas extends StatefulWidget {

  late List<Perguntas> perguntas;
  late int indice;

  TilePerguntas({Key? key, required this.perguntas, required this.indice}) : super(key: key);
  @override
  State<TilePerguntas> createState() => _TilePerguntasState();


}

class _TilePerguntasState extends State<TilePerguntas> {
  bool isChecking = false;


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("did change");
    //print(widget.perguntas);
  }

  @override
  void initState() {
    super.initState();
    print("iniciando");
    //print(widget.perguntas);
  }

  @override
  Widget build(BuildContext context) {
    print("imprimindo perguntas");
    print(widget.indice);
    if (widget.perguntas.length ==0){
      return Container();
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: Text(
                  widget.perguntas[widget.indice].titulo,
                  style: const TextStyle(fontSize: 16),

                ),
              )
            ],
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
              itemCount:widget.perguntas[widget.indice].respostas.length,
              itemBuilder: (context,i){
                List<String> respostas = widget.perguntas[widget.indice].respostas;
                return Row(
                  children: [
                    Checkbox(
                      onChanged: (bool? value){
                        setState(() {
                          widget.perguntas[widget.indice].marcada = i;
                        });

                      },
                      value: widget.perguntas[widget.indice].marcada == i,
                    ),
                    Text(respostas[i]),

                  ],
                );
              }),
        ],
      ),
    );
  }
}