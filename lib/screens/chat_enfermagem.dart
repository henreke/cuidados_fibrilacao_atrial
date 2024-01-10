
import 'package:cuidados_fibrilacao_atrial/blocs/chat_enfermagem_manager.dart';
import 'package:cuidados_fibrilacao_atrial/blocs/user_manager.dart';
import 'package:cuidados_fibrilacao_atrial/data/chat.dart';
import 'package:cuidados_fibrilacao_atrial/data/paciente.dart';
import 'package:cuidados_fibrilacao_atrial/widgets/chat_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/utils.dart';
class ChatScreenEnfermagem extends StatefulWidget {

  final Paciente paciente;
  const ChatScreenEnfermagem({Key? key,required this.paciente}) : super(key: key);

  @override
  State<ChatScreenEnfermagem> createState() => _ChatScreenEnfermagemState();
}

class _ChatScreenEnfermagemState extends State<ChatScreenEnfermagem>{

  UserManager? _userManager;
  ChatEnfermagemManager _chatManager = ChatEnfermagemManager();
  final TextEditingController _msgController = TextEditingController();
  final TextEditingController _horarioController = TextEditingController();
  final TextEditingController _atividadeController = TextEditingController();
  final TextEditingController _alimentacaoController = TextEditingController();
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _habitosController = TextEditingController();
  final TextEditingController _consultasController = TextEditingController();
  final TextEditingController _examesController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final UserManager userManager = Provider.of<UserManager>(context);
    if (_userManager != userManager) {
      _userManager = userManager;
      _chatManager.getChatPaciente(uid: widget.paciente.uid!);
    }
  }


  @override
  void dispose() {
    _chatManager.dispose();

    super.dispose();
  }
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Orientações de Enfermagem'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: StreamBuilder<List<Chat>>(
                stream: _chatManager.listChat,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Chat> lista = snapshot.data!;
                    return ListView.builder(
                        itemCount: lista.length,
                        controller: _controller,
                        shrinkWrap: true,
                        reverse: true,
                        padding: const EdgeInsets.only(top: 10,bottom: 10),
                        //physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, item) {
                          return ChatTile(
                            msg:lista[item].msg!,
                            hora: Utils.epochToBigString( lista[item].tempo?? 0),
                          );
                        }
                    );

                  } else {
                    return const CircularProgressIndicator();
                  }
                }
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height/2,
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: StreamBuilder<bool>(
                  stream: _chatManager.isLoading,
                  builder: (context, snapshot) {
                    bool enviando = snapshot.data?? false;
                    return SizedBox(
                      //aaaheight: 70,
                      width: double.infinity,
                      child: Column(
                        children: [
                          txtEnvio(enviando, "Horário da Medicação", _horarioController),
                          txtEnvio(enviando, "Atividade Física", _atividadeController),
                          txtEnvio(enviando, "Alimentação", _alimentacaoController),
                          txtEnvio(enviando, "Controle de peso", _pesoController),
                          txtEnvio(enviando, "Hábitos saudáveis de estilos de vida", _habitosController),
                          txtEnvio(enviando, "Agendamento das consultas regulares", _consultasController),
                          txtEnvio(enviando, "Agendamento de exames se necessário", _examesController),
                          txtEnvio(enviando,"Orientações Gerais" , _msgController),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Container(


                                child: enviando ? const CircularProgressIndicator() : ElevatedButton(
                                    child: const Text('Enviar',style: TextStyle(fontSize: 16)),
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
                                    onPressed:  (){
                                      if (_horarioController.text.isNotEmpty) {
                                        _chatManager
                                            .enviarChatPaciente(
                                            idUser: _userManager!.uid,
                                            idPaciente: widget.paciente.uid!,
                                            msg: _horarioController.text)
                                            .then((success) {
                                          if (success) {
                                            _horarioController.clear();
                                            _chatManager.getChatPaciente(
                                                uid: widget.paciente.uid!);
                                          }
                                        });
                                      }
                                      if (_atividadeController.text.isNotEmpty) {
                                        _chatManager
                                            .enviarChatPaciente(
                                            idUser: _userManager!.uid,
                                            idPaciente: widget.paciente.uid!,
                                            msg: _atividadeController.text)
                                            .then((success) {
                                          if (success) {
                                            _atividadeController.clear();
                                            _chatManager.getChatPaciente(
                                                uid: widget.paciente.uid!);
                                          }
                                        });
                                      }
                                      if (_alimentacaoController.text.isNotEmpty) {
                                        _chatManager
                                            .enviarChatPaciente(
                                            idUser: _userManager!.uid,
                                            idPaciente: widget.paciente.uid!,
                                            msg: _alimentacaoController.text)
                                            .then((success) {
                                          if (success) {
                                            _alimentacaoController.clear();
                                            _chatManager.getChatPaciente(
                                                uid: widget.paciente.uid!);
                                          }
                                        });
                                      }
                                      if (_pesoController.text.isNotEmpty) {
                                        _chatManager
                                            .enviarChatPaciente(
                                            idUser: _userManager!.uid,
                                            idPaciente: widget.paciente.uid!,
                                            msg: _pesoController.text)
                                            .then((success) {
                                          if (success) {
                                            _pesoController.clear();
                                            _chatManager.getChatPaciente(
                                                uid: widget.paciente.uid!);
                                          }
                                        });
                                      }
                                      if (_habitosController.text.isNotEmpty) {
                                        _chatManager
                                            .enviarChatPaciente(
                                            idUser: _userManager!.uid,
                                            idPaciente: widget.paciente.uid!,
                                            msg: _habitosController.text)
                                            .then((success) {
                                          if (success) {
                                            _habitosController.clear();
                                            _chatManager.getChatPaciente(
                                                uid: widget.paciente.uid!);
                                          }
                                        });
                                      }
                                      if (_consultasController.text.isNotEmpty) {
                                        _chatManager
                                            .enviarChatPaciente(
                                            idUser: _userManager!.uid,
                                            idPaciente: widget.paciente.uid!,
                                            msg: _consultasController.text)
                                            .then((success) {
                                          if (success) {
                                            _consultasController.clear();
                                            _chatManager.getChatPaciente(
                                                uid: widget.paciente.uid!);
                                          }
                                        });
                                      }
                                      if (_examesController.text.isNotEmpty) {
                                        _chatManager
                                            .enviarChatPaciente(
                                            idUser: _userManager!.uid,
                                            idPaciente: widget.paciente.uid!,
                                            msg: _examesController.text)
                                            .then((success) {
                                          if (success) {
                                            _examesController.clear();
                                            _chatManager.getChatPaciente(
                                                uid: widget.paciente.uid!);
                                          }
                                        });
                                      }
                                      if (_msgController.text.isNotEmpty) {
                                        _chatManager
                                            .enviarChatPaciente(
                                            idUser: _userManager!.uid,
                                            idPaciente: widget.paciente.uid!,
                                            msg: _msgController.text)
                                            .then((success) {
                                          if (success) {
                                            _msgController.clear();
                                            _chatManager.getChatPaciente(
                                                uid: widget.paciente.uid!);
                                          }
                                        });
                                      }

                                    },

                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget txtEnvio(bool enviando, String label, TextEditingController _controller){
    return TextFormField(
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
    );
  }
}
