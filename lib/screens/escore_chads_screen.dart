import 'package:flutter/material.dart';

class EscoreChadScreen extends StatefulWidget {
  EscoreChadScreen({Key? key}) : super(key: key);
  List<bool> checks = [false,false,false,false,false,false,false,false];
  int escore = 0;
  String risco ="anticoagulação plena (warfarina, para INR entre 2,0 e 3,0)";
  @override
  State<EscoreChadScreen> createState() => _EscoreChadScreenState();
}

class _EscoreChadScreenState extends State<EscoreChadScreen> {

  void CalcularEscore(){
    List<int> checks_int = [1,1,2,1,2,1,1,1];
    int indice = 0;
    int total = 0;
    widget.checks.forEach((elemento) {
      if (elemento)
        {
          total += checks_int[indice];
        }
      indice++;
    });
    widget.escore = total;
    if (widget.escore >= 2){
      widget.risco = "anticoagulação plena (warfarina, para INR entre 2,0 e 3,0)";
    }
    if (widget.escore == 1){
      widget.risco = "anticoagulação plena ou antiagregação (AAS 75 a 325mg/dia) – o algoritmo da ACCP recomenda anticoagulação plena sempre que possível. ";
    }
    if (widget.escore == 0){
      widget.risco = "antiagregação (AAS) ou nada – o benefício do uso do AAS para esse grupo não está bem estabelecido. Além disso, o uso do AAS pode levar a eventos adversos.";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CHADS-VASc"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          CheckboxListTile(
            title: Text("Insuficiência Cardíaca"),
            value: widget.checks[0],
            onChanged: (valor){
              setState(() {
                widget.checks[0] = valor!;
                CalcularEscore();
              });
            },
          ),
          CheckboxListTile(
            title: Text("Hipertensão"),
            value: widget.checks[1],
            onChanged: (valor){
              setState(() {
                widget.checks[1] = valor!;
                CalcularEscore();
              });
            },
          ),
          CheckboxListTile(
            title: Text("Idade(\u2265 75 anos)"),
            value: widget.checks[2],
            onChanged: (valor){
              setState(() {
                widget.checks[2] = valor!;
                if (widget.checks[6]){
                  widget.checks[6] = false;
                }
                CalcularEscore();
              });
            },
          ),
          CheckboxListTile(
            title: Text("Diabetes Mellitus"),
            value: widget.checks[3],
            onChanged: (valor){
              setState(() {
                widget.checks[3] = valor!;
                CalcularEscore();
              });
            },
          ),
          CheckboxListTile(
            title: Text("AIT ou AVC prévio"),
            value: widget.checks[4],
            onChanged: (valor){
              setState(() {
                widget.checks[4] = valor!;
                CalcularEscore();
              });
            },
          ),
          CheckboxListTile(
            title: Text("Doença Vascular"),
            value: widget.checks[5],
            onChanged: (valor){
              setState(() {
                widget.checks[5] = valor!;
                CalcularEscore();
              });
            },
          ),
          CheckboxListTile(
            title: Text("Idade (65-74 anos)"),
            value: widget.checks[6],
            onChanged: (valor){
              setState(() {
                widget.checks[6] = valor!;
                if (widget.checks[2]){
                  widget.checks[2] = false;
                }
                CalcularEscore();
              });
            },
          ),
          CheckboxListTile(
            title: Text("Sexo(se feminino)"),
            value: widget.checks[7],
            onChanged: (valor){
              setState(() {
                widget.checks[7] = valor!;
                CalcularEscore();
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Escore Total ${widget.escore}",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Recomendações",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                Text("${widget.risco}",style: TextStyle(fontSize: 16),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}


