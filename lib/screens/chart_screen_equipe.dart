import 'package:cuidados_fibrilacao_atrial/blocs/chat_manager.dart';
import 'package:cuidados_fibrilacao_atrial/blocs/user_manager.dart';
import 'package:cuidados_fibrilacao_atrial/data/chat.dart';
import 'package:cuidados_fibrilacao_atrial/data/paciente.dart';
import 'package:cuidados_fibrilacao_atrial/widgets/chat_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ChatScreenSaude extends StatefulWidget {

  final Paciente paciente;
  const ChatScreenSaude({Key? key,required this.paciente}) : super(key: key);

  @override
  State<ChatScreenSaude> createState() => _ChatScreenSaudeState();
}

class _ChatScreenSaudeState extends State<ChatScreenSaude>{

  UserManager? _userManager;
  ChatManager _chatManager = ChatManager();
  final TextEditingController _msgController = TextEditingController();

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
        title: const Text('Orientações'),
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
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8.0),
            child: StreamBuilder<bool>(
              stream: _chatManager.isLoading,
              builder: (context, snapshot) {
                bool enviando = snapshot.data!;
                return SizedBox(
                  //aaaheight: 70,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Flexible(

                        child: TextFormField(
                          controller: _msgController,
                          maxLength: 255,
                          maxLines: null,
                          enabled: !enviando,
                          decoration: InputDecoration(
                            labelText: "Orientações para o paciente",
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
                      ),
                      const SizedBox(width: 4,),
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(30)
                        ),
                        child: enviando ? const CircularProgressIndicator() : IconButton(
                            onPressed:  (){
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
                            icon: const Icon(Icons.send)),
                      ),
                    ],
                  ),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
