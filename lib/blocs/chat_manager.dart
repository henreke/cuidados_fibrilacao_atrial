import 'package:cuidados_fibrilacao_atrial/data/chat.dart';
import 'package:cuidados_fibrilacao_atrial/utils/utils.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ChatManager{

  BehaviorSubject<bool> _blcisLoading =  BehaviorSubject<bool>.seeded(false);
  Stream<bool> get isLoading =>_blcisLoading.stream;

  BehaviorSubject<List<Chat>> _blcListChat =  BehaviorSubject<List<Chat>>.seeded(<Chat>[]);
  Stream<List<Chat>> get listChat =>_blcListChat.stream;



  void dispose(){
    _blcisLoading.close();
    _blcListChat.close();
  }

  Future<List<Chat>> getChatPaciente({required String uid}) async{
    _blcisLoading.add(true);
    List<Chat> chats = <Chat>[];
    var response = await http.post(
      Uri.parse("${Utils.server_path}/chat/getChatPaciente.php"),
      body: json.encode({'idPaciente':uid}),
      headers: {'Content-Type': 'application/json'},
    );

    List<dynamic> mapa = jsonDecode(response.body);

    mapa.forEach((chat) {
      chats.add(Chat(
        id: chat['id'],
        msg: chat['msg'],
        visto: chat['visto'],
        nomeEnviado: chat['nome']
      ));
    });
    _blcisLoading.add(false);
    _blcListChat.add(chats);
    return chats;
  }
}