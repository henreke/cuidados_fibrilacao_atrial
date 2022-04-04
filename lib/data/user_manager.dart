import 'package:cuidados_fibrilacao_atrial/utils/firebase_erros.dart';
import 'package:cuidados_fibrilacao_atrial/utils/utils.dart';
import 'user.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
class UserManager {

  Users _user = Users(nome: '',email: '',senha: '',dtnascimento: 0,tipo: 0);
  BehaviorSubject<bool> _blcisLoading =  BehaviorSubject<bool>.seeded(false);
  Stream<bool> get isLoading =>_blcisLoading.stream;



  Future<int> cadUser({required VoidCallback onSuccess, required VoidCallback onFail, required Users user}) async {
    _blcisLoading.add(true);
    //await Future.delayed(Duration(seconds: 5));
    var response = await http.post(
      Uri.parse("${Utils.server_path}/Users/cadUsers.php"),
      body: json.encode(user.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    var mapa = jsonDecode(response.body);
    var sucesso = mapa['success'];
    switch (sucesso) {
      case -1:
        onFail();
        break;
      case 1:
        onSuccess();
        break;
      case 2:
        onFail();
        break;
    }
    _blcisLoading.add(false);
    return sucesso;

  }
  void dispose(){
    _blcisLoading.close();
  }

  Future<int> login({required Users user, required void Function() onSuccess, required void Function() onFail}) async{
    _blcisLoading.add(true);
    var response = await http.post(
      Uri.parse("${Utils.server_path}/Users/loginJWT.php"),
      body: json.encode({'email':user.email,'senha':user.senha}),
      headers: {'Content-Type': 'application/json'},
    );
    print(response.body);
    var mapa = jsonDecode(response.body);
    _user.isLogged = mapa['id'] != '';
    _user.id = mapa['id'];
    _user.nome = mapa['nome'];
    _user.tipo = mapa['tipo'];
    print('sucesso');
    _blcisLoading.add(false);
    return 1;
  }
}