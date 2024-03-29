import 'package:cuidados_fibrilacao_atrial/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../blocs/avaliacao_manager.dart';
import '../blocs/user_manager.dart';
import '../data/avaliacao2.dart';

class AutoAvaliacaoScreenView extends StatefulWidget {
  AutoAvaliacaoScreenView({Key? key, this.idPaciente = ''}) : super(key: key);
  int sangramento = -1;
  int manchas = -1;
  int urgencia = -1;
  int nova_medicacao = -1;
  int alimentacao = -1;
  int acrescimo_medicacao = -1;

  int manchas_escolha = 0;
  int indice = -1;
  int total_avaliacoes = 0;
  final String idPaciente;
  @override
  State<AutoAvaliacaoScreenView> createState() => _AutoAvaliacaoScreenViewState();
}

class _AutoAvaliacaoScreenViewState extends State<AutoAvaliacaoScreenView> {

  UserManager? _userManager;
  AvaliacaoManager avaliacao_manager = AvaliacaoManager();
  DateTime tempo = DateTime.now();
  TextEditingController txtLocal = TextEditingController();
  TextEditingController txtUrgencia = TextEditingController();
  TextEditingController txtNovaMedicacao = TextEditingController();
  TextEditingController txtAlimentacao = TextEditingController();
  TextEditingController txtAcrescimoMedicacao = TextEditingController();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final UserManager userManager = Provider.of<UserManager>(context);
    if (_userManager != userManager) {
      _userManager = userManager;
      String _id = _userManager!.uid;
      if (widget.idPaciente.isNotEmpty){
        _id = widget.idPaciente;
      }
      avaliacao_manager.getAvaliacao2(idUser: _id).then((value) {
        widget.indice = value;
        widget.total_avaliacoes = value;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Auto Avaliação"),
        centerTitle: true,
      ),
      body: StreamBuilder<List<Avaliacao2>>(
        stream: avaliacao_manager.listaAvaliacaoPaciente,
        builder: (context, snapshot) {

          if (snapshot.hasData){
           

            if(widget.indice >=0) {
                widget.sangramento = snapshot.data![widget.indice].sangramento;
                txtLocal.text = snapshot.data![widget.indice].sangramento_txt;
                widget.manchas = snapshot.data![widget.indice].manchas;
                widget.manchas_escolha = snapshot.data![widget.indice].manchas_escolha;
                widget.urgencia = snapshot.data![widget.indice].urgencia;
                txtUrgencia.text = snapshot.data![widget.indice].urgencia_txt;
                widget.nova_medicacao = snapshot.data![widget.indice].nova_medicacao;
                txtNovaMedicacao.text = snapshot.data![widget.indice].novaMedicacao_txt;
                widget.alimentacao = snapshot.data![widget.indice].alimentacao;
                txtAlimentacao.text = snapshot.data![widget.indice].alimentacao_txt;
                widget.acrescimo_medicacao = snapshot.data![widget.indice].acrescimo_medicacao;
                txtAcrescimoMedicacao.text = snapshot.data![widget.indice].acrescimoMedicacao_txt;
                tempo = DateTime.fromMillisecondsSinceEpoch(snapshot.data![widget.indice].data*1000);

              }
            }
          return ListView(
            children: [
              Text("Data: ${Utils.dataToString(tempo)}"),
              Text("Hora: ${tempo.hour}:${tempo.minute}"),
              PerguntaTile(titulo_principal: "Apresentou sangramento?",sim: widget.sangramento,titulo2: "Qual local?",txt: txtLocal,
                valueSetter: (value)=>setState(()=>widget.sangramento = value),
              ),
              PerguntaTile2(sim: widget.manchas,escolha: widget.manchas_escolha,
                valueSetter1: (value)=>setState(()=>widget.manchas = value),
                valueSetter2: (value)=>setState(()=>widget.manchas_escolha = value),
              ),
              PerguntaTile(titulo_principal: "Buscou um atendimento de urgência?",sim: widget.urgencia,titulo2: "Explique o motivo:",txt: txtUrgencia,
                  valueSetter: (value)=>setState(()=>widget.urgencia = value)),
              PerguntaTile(titulo_principal: "Foi prescrito nova medicação?",sim: widget.nova_medicacao,titulo2: "Qual?",txt: txtNovaMedicacao,valueSetter: (value)=>setState(()=>widget.nova_medicacao = value) ),
              PerguntaTile(titulo_principal: "Houve mudança na alimentação?",sim: widget.alimentacao,titulo2: "Qual?",txt: txtAlimentacao,
                  valueSetter: (value)=>setState(()=>widget.alimentacao = value)),
              PerguntaTile(titulo_principal: "Houve acréscimo de alguma medicação desde a última consulta?",sim: widget.acrescimo_medicacao,titulo2: "Qual?",txt: txtAcrescimoMedicacao,
                  valueSetter: (value)=>setState(()=>widget.acrescimo_medicacao = value)),
              const SizedBox(height: 12,),
              StreamBuilder<bool>(
                  stream: avaliacao_manager.isLoading,
                  builder: (context,snapshot) {
                    bool _isLoading = snapshot.hasData ? snapshot.data! : false;
                    if (!_isLoading) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {

                             setState(() {
                               if (widget.indice > 0) {
                                    widget.indice--;
                                  }
                                });
                            },
                            child: Text('Anterior'),
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
                          ),
                          ElevatedButton(
                            onPressed: () {

                              setState(() {
                                  if (widget.indice < widget.total_avaliacoes){
                                    widget.indice = widget.indice + 1;
                                  }
                              });
                            },
                            child: Text('Próximo'),
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
                          ),
                        ],
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
          );
        }
      ),
    );
  }
}


class PerguntaTile extends StatefulWidget {
  PerguntaTile({Key? key, required this.titulo_principal,required this.sim, required this.titulo2,required this.txt, required this.valueSetter}) : super(key: key);
  final String titulo_principal;
  int sim;
  bool enviando = false;
  TextEditingController txt;
  final String titulo2;
  final ValueSetter valueSetter;
  @override
  State<PerguntaTile> createState() => _PerguntaTileState();
}

class _PerguntaTileState extends State<PerguntaTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.titulo_principal),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 4,),
                Text("Sim"),
                Checkbox(
                  value: widget.sim == 1,
                  onChanged: (value) => widget.valueSetter(1)
                ),

                Text("Não"),
                Checkbox(
                  value: widget.sim == 0,
                  onChanged:(value) => widget.valueSetter(0),
                ),
              ],
            ),
          ),
          if(widget.sim == 1)txtEnvio(
              widget.enviando,
              widget.titulo2,
              widget.txt
          ),
        ],
      ),
    );
  }

  Widget txtEnvio(bool enviando, String label, TextEditingController _controller){
    return Padding(
      padding: const EdgeInsets.only(left: 12,right: 12),
      child: TextFormField(
          controller: _controller,
          maxLength: 255,
          maxLines: null,
          enabled: !enviando,
          decoration: InputDecoration(
            labelText: label,
            filled: true,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 2.0,
              ),
            ),
          )
      ),
    );
  }
}


class PerguntaTile2 extends StatefulWidget {
  PerguntaTile2({Key? key, required this.escolha,required this.sim, required this.valueSetter1, required this.valueSetter2}) : super(key: key);
  int sim;
  int escolha;
  final ValueSetter valueSetter1;
  final ValueSetter valueSetter2;
  @override
  State<PerguntaTile2> createState() => _PerguntaTileState2();
}

class _PerguntaTileState2 extends State<PerguntaTile2> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Apresentou manchas roxas?"),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 4,),
                Text("Sim"),
                Checkbox(
                  value: widget.sim == 1,
                  onChanged: (value) => widget.valueSetter1(1),
                ),

                Text("Não"),
                Checkbox(
                  value: widget.sim == 0,
                  onChanged:(value) => widget.valueSetter1(0),
                ),
              ],
            ),
          ),
          if(widget.sim == 1)Row(
            children: [
              Text("Pequena"),
              Checkbox(
                value: widget.escolha == 0,
                onChanged: (value){
                  widget.valueSetter2(value! ? 0 : widget.escolha);
                },
              ),
              Text("Moderada"),
              Checkbox(
                value: widget.escolha == 1,
                onChanged: (value){
                  widget.valueSetter2(value! ? 1 : widget.escolha);
                },
              ),
              Text("Grande"),
              Checkbox(
                value: widget.escolha == 2,
                onChanged: (value){
                  widget.valueSetter2(value! ? 2 : widget.escolha);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

}
