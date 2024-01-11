import 'package:cuidados_fibrilacao_atrial/blocs/user_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../blocs/has_manager.dart';
import '../data/has.dart';

class EscoreHasBledScreen extends StatefulWidget {
  EscoreHasBledScreen({Key? key, this.idPaciente = ''}) : super(key: key);
  List<bool> checks = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  int escore = 0;
  String risco = "Baixo Risco";
  String idPaciente;
  @override
  State<EscoreHasBledScreen> createState() => _EscoreHasBledScreenState();
}

class _EscoreHasBledScreenState extends State<EscoreHasBledScreen> {
  UserManager? _userManager;
  HasManager chads_manager = HasManager();
  TextEditingController txtquais = TextEditingController();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final UserManager userManager = Provider.of<UserManager>(context);
    if (_userManager != userManager) {
      _userManager = userManager;
    }
  }

  void CalcularEscore() {
    List<int> checks_int = [1, 1, 1, 1, 1, 1, 1, 1, 1];
    int indice = 0;
    int total = 0;
    widget.checks.forEach((elemento) {
      if (elemento) {
        total += checks_int[indice];
      }
      indice++;
    });
    widget.escore = total;
    if (widget.escore == 0) {
      widget.risco = "Baixo Risco";
    }
    if (widget.escore <= 2 && widget.escore > 0) {
      widget.risco = "Risco Moderado: Anticoagulação plena ou antiagregação";
    }
    if (widget.escore >= 3) {
      widget.risco = "Risco Alto: Anticoagulação plena";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ferramenta HAS-BLED"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          CheckboxListTile(
            title: Text("Hipertensão"),
            value: widget.checks[0],
            onChanged: (valor) {
              setState(() {
                widget.checks[0] = valor!;
                CalcularEscore();
              });
            },
          ),
          CheckboxListTile(
            title: Text("Alteração da função renal"),
            value: widget.checks[1],
            onChanged: (valor) {
              setState(() {
                widget.checks[1] = valor!;
                CalcularEscore();
              });
            },
          ),
          CheckboxListTile(
            title: Text("Alteração da função hepática"),
            value: widget.checks[2],
            onChanged: (valor) {
              setState(() {
                widget.checks[2] = valor!;
                CalcularEscore();
              });
            },
          ),
          CheckboxListTile(
            title: Text("AVC"),
            value: widget.checks[3],
            onChanged: (valor) {
              setState(() {
                widget.checks[3] = valor!;

                CalcularEscore();
              });
            },
          ),
          CheckboxListTile(
            title: Text("Sangramento Prévio"),
            value: widget.checks[4],
            onChanged: (valor) {
              setState(() {
                widget.checks[4] = valor!;
                CalcularEscore();
              });
            },
          ),
          CheckboxListTile(
            title: Text("Labilidade do INR"),
            value: widget.checks[5],
            onChanged: (valor) {
              setState(() {
                widget.checks[5] = valor!;
                CalcularEscore();
              });
            },
          ),
          CheckboxListTile(
            title: Text("Idade > 65 anos"),
            value: widget.checks[6],
            onChanged: (valor) {
              setState(() {
                widget.checks[6] = valor!;
                CalcularEscore();
              });
            },
          ),
          CheckboxListTile(
            title: Text("Uso de medicamento que interfira no anticoagulante"),
            value: widget.checks[7],
            onChanged: (valor) {
              setState(() {
                widget.checks[7] = valor!;

                CalcularEscore();
              });
            },
          ),

          if(widget.checks[7])Padding(
            padding: const EdgeInsets.only(left: 12, right: 12,top: 10),
            child: TextFormField(
                controller: txtquais,
                maxLength: 255,
                maxLines: null,
                decoration: InputDecoration(
                  labelText: "Quais?",
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
                )),
          ),
          CheckboxListTile(
            title: Text("Consumo de álcool"),
            value: widget.checks[8],
            onChanged: (valor) {
              setState(() {
                widget.checks[8] = valor!;
                CalcularEscore();
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Escore Total ${widget.escore}",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Recomendações",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${widget.risco}",
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
          StreamBuilder<bool>(
              stream: chads_manager.isLoading,
              builder: (context, snapshot) {
                bool _isLoading = snapshot.hasData ? snapshot.data! : false;
                if (!_isLoading) {
                  return ElevatedButton(
                    onPressed: () {
                      String _id = widget.idPaciente.isNotEmpty
                          ? widget.idPaciente
                          : _userManager!.uid;
                      Has has = Has(
                        idPaciente: _id,
                        valor: 0,
                        obs: txtquais.text
                      );
                      has.setValorFromList(widget.checks);
                      chads_manager.cadChads(
                          avaliacao: has,
                          onSuccess: () {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                  'Sua avaliação foi enviada com sucesso!'),
                            ));
                          },
                          onFail: () {});
                    },
                    child: Text('Enviar'),
                    style: ButtonStyle(
                        textStyle: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return TextStyle(color: Colors.black);
                          }
                          return TextStyle(color: Colors.white);
                        }),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                        backgroundColor:
                            MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.green[50];
                          }
                          return Theme.of(context).primaryColor;
                        })),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.green),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
