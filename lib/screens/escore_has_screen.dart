import 'package:flutter/material.dart';

class EscoreHasBledScreen extends StatefulWidget {
  EscoreHasBledScreen({Key? key}) : super(key: key);
  List<bool> checks = [false,false,false,false,false,false,false,false,false];
  int escore = 0;
  String risco ="";
  @override
  State<EscoreHasBledScreen> createState() => _EscoreHasBledScreenState();
}

class _EscoreHasBledScreenState extends State<EscoreHasBledScreen> {

  void CalcularEscore(){
    List<int> checks_int = [1,1,1,1,1,1,1,1,1];
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
    if (widget.escore >= 3){
      widget.risco = "Risco Alto";
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HAS-BLED"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          CheckboxListTile(
            title: Text("Hipertensão"),
            value: widget.checks[0],
            onChanged: (valor){
              setState(() {
                widget.checks[0] = valor!;
                CalcularEscore();
              });
            },
          ),
          CheckboxListTile(
            title: Text("Alteração da função renal"),
            value: widget.checks[1],
            onChanged: (valor){
              setState(() {
                widget.checks[1] = valor!;
                CalcularEscore();
              });
            },
          ),
          CheckboxListTile(
            title: Text("Alteração da função hepática"),
            value: widget.checks[2],
            onChanged: (valor){
              setState(() {
                widget.checks[2] = valor!;
                CalcularEscore();
              });
            },
          ),
          CheckboxListTile(
            title: Text("AVC"),
            value: widget.checks[3],
            onChanged: (valor){
              setState(() {
                widget.checks[3] = valor!;

                CalcularEscore();
              });
            },
          ),
          CheckboxListTile(
            title: Text("Sangramento Prévio"),
            value: widget.checks[4],
            onChanged: (valor){
              setState(() {
                widget.checks[4] = valor!;
                CalcularEscore();
              });
            },
          ),
          CheckboxListTile(
            title: Text("Labilidade de RNI"),
            value: widget.checks[5],
            onChanged: (valor){
              setState(() {
                widget.checks[5] = valor!;
                CalcularEscore();
              });
            },
          ),
          CheckboxListTile(
            title: Text("Idade > 65 anos"),
            value: widget.checks[6],
            onChanged: (valor){
              setState(() {
                widget.checks[6] = valor!;
                CalcularEscore();
              });
            },
          ),
          CheckboxListTile(
            title: Text("Uso de Medicamentos"),
            value: widget.checks[7],
            onChanged: (valor){
              setState(() {
                widget.checks[7] = valor!;

                CalcularEscore();
              });
            },
          ),
          CheckboxListTile(
            title: Text("Consumo de álcool"),
            value: widget.checks[8],
            onChanged: (valor){
              setState(() {
                widget.checks[8] = valor!;
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


