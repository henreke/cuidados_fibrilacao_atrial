import 'package:cuidados_fibrilacao_atrial/blocs/chat_manager.dart';
import 'package:cuidados_fibrilacao_atrial/blocs/user_manager.dart';
import 'package:cuidados_fibrilacao_atrial/data/chat.dart';
import 'package:cuidados_fibrilacao_atrial/widgets/chat_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/utils.dart';
class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  UserManager? _userManager;
  ChatManager _chatManager = ChatManager();


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final UserManager userManager = Provider.of<UserManager>(context);
    if (_userManager != userManager) {
      _userManager = userManager;
      _chatManager.getChatPaciente(uid: _userManager!.uid);
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
        title: const Text('Orientações Médicas'),
      ),
      body: StreamBuilder<List<Chat>>(
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
    );
  }
}
