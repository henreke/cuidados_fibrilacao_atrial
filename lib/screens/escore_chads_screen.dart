import 'package:cuidados_fibrilacao_atrial/blocs/chads_manager.dart';
import 'package:cuidados_fibrilacao_atrial/blocs/user_manager.dart';
import 'package:cuidados_fibrilacao_atrial/data/chads.dart';
import 'package:cuidados_fibrilacao_atrial/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class EscoreChadScreen extends StatefulWidget {
  EscoreChadScreen({Key? key, this.idPaciente  = ''}) : super(key: key);
  List<bool> checks = [false,false,false,false,false,false,false,false];
  int escore = 0;
  String risco ="Antiagregação (AAS) ou nada .";
  String idPaciente;
  DateTime tempo = DateTime.now();
  @override
  State<EscoreChadScreen> createState() => _EscoreChadScreenState();
}

class _EscoreChadScreenState extends State<EscoreChadScreen> {


  UserManager? _userManager;
  ChadsManager chads_manager = ChadsManager();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final UserManager userManager = Provider.of<UserManager>(context);
    if (_userManager != userManager) {
      _userManager = userManager;
    }
  }

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
    widget.risco = "Antiagregação (AAS) ou nada .";
    widget.escore = total;
    if (widget.escore >= 2){
      widget.risco = "Indicação para Anticoagulação";
    }
    if (widget.escore == 1 && !widget.checks[7]){
      widget.risco = "Indicação para Anticoagulação";
    }
    if (widget.escore == 0){
      widget.risco = "Antiagregação (AAS) ou nada .";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ferramenta CHA${String.fromCharCodes([0x2082])}DS${String.fromCharCodes([0x2082])}-VASc",style: TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Text("Data: ${Utils.dataToString(widget.tempo)} - ${Utils.horaToString(widget.tempo)}"),
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
            title: Text("Acidente Isquêmico Transitório (AIT) ou Acidente Vascular Cerebral (AVC) prévio"),
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
          StreamBuilder<bool>(
              stream: chads_manager.isLoading,
              builder: (context,snapshot) {
                bool _isLoading = snapshot.hasData ? snapshot.data! : false;
                if (!_isLoading) {
                  return ElevatedButton(
                    onPressed: () {
                      String _id = widget.idPaciente.isNotEmpty ?  widget.idPaciente : _userManager!.uid;
                      Chads chads = Chads(
                        idPaciente: _id,
                        valor: 0,
                      );
                      chads.setValorFromList(widget.checks);
                      chads_manager.cadChads(
                          avaliacao: chads, onSuccess: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Sua avaliação foi enviada com sucesso!'),
                            ));
                      }, onFail: () {});
                    },
                    child: Text('Enviar'),
                    style: ButtonStyle(
                        textStyle: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)){
                            return TextStyle(color: Colors.black);
                          }
                          return TextStyle(color: Colors.white);
                        }),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                        backgroundColor: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)){
                            return Colors.green[50];
                          }
                          return Theme.of(context).primaryColor;
                        })
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.green),
                  ),
                );
              }
          ),
        ],
      ),
    );
  }
}


