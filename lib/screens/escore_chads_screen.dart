import 'package:flutter/material.dart';

class EscoreChadScreen extends StatefulWidget {
  EscoreChadScreen({Key? key}) : super(key: key);
  List<bool> checks = [false,false,false,false,false,false,false,false];
  @override
  State<EscoreChadScreen> createState() => _EscoreChadScreenState();
}

class _EscoreChadScreenState extends State<EscoreChadScreen> {
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
              });
            },
          ),
          CheckboxListTile(
            title: Text("Hipertensão"),
            value: widget.checks[1],
            onChanged: (valor){
              setState(() {
                widget.checks[1] = valor!;
              });
            },
          ),
          CheckboxListTile(
            title: Text("Idade(>=75 anos)"),
            value: widget.checks[2],
            onChanged: (valor){
              setState(() {
                widget.checks[2] = valor!;
                if (widget.checks[6]){
                  widget.checks[6] = false;
                }
              });
            },
          ),
          CheckboxListTile(
            title: Text("Diabetes Mellitus"),
            value: widget.checks[3],
            onChanged: (valor){
              setState(() {
                widget.checks[3] = valor!;
              });
            },
          ),
          CheckboxListTile(
            title: Text("AIT ou AVC prévio"),
            value: widget.checks[4],
            onChanged: (valor){
              setState(() {
                widget.checks[4] = valor!;
              });
            },
          ),
          CheckboxListTile(
            title: Text("Doença Vascular"),
            value: widget.checks[5],
            onChanged: (valor){
              setState(() {
                widget.checks[5] = valor!;
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
              });
            },
          ),
          CheckboxListTile(
            title: Text("Sexo(se feminino)"),
            value: widget.checks[7],
            onChanged: (valor){
              setState(() {
                widget.checks[7] = valor!;
              });
            },
          ),
        ],
      ),
    );
  }
}


