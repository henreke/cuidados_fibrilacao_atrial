import 'package:cuidados_fibrilacao_atrial/utils/firebase_erros.dart';
import 'package:cuidados_fibrilacao_atrial/utils/utils.dart';
import '../data/user.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import  'package:flutter_secure_storage/flutter_secure_storage.dart';
class UserManager {

  Users _user = Users(nome: '',email: '',senha: '',dtnascimento: 0,tipo: 0);

  BehaviorSubject<bool> _blcisLoading =  BehaviorSubject<bool>.seeded(false);
  Stream<bool> get isLoading =>_blcisLoading.stream;

  BehaviorSubject<bool> _blcisLogged = BehaviorSubject<bool>.seeded(false);
  Stream<bool> get isLogged =>_blcisLogged.stream;

  Timer? timerJWT;

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
    _blcisLogged.close();
    if (timerJWT != null){
      timerJWT!.cancel();
    }
  }

  Future<int> login({required Users user, required void Function() onSuccess, required void Function() onFail}) async{
    _blcisLoading.add(true);
    var response = await http.post(
      Uri.parse("${Utils.server_path}/Users/loginJWT.php"),
      body: json.encode({'email':user.email,'senha':user.senha}),
      headers: {'Content-Type': 'application/json'},
    );
    //print(response.body);
    var mapa = jsonDecode(response.body);
    _user.isLogged = mapa['id'] != '-1';
    if (_user.isLogged) {
      _user.id = mapa['id'];
      _user.nome = mapa['nome'];
      _user.tipo = mapa['tipo'];
      _user.email = user.email;
      _user.senha = user.senha;
      _user.jwt = mapa['jwt'];
      salvarLogin();
      _blcisLogged.add(_user.isLogged);
      _blcisLoading.add(false);
      timerJWT = Timer.periodic(const Duration(seconds: 60), (timer) {
        renovarJWT();
      });
      onSuccess();
      return 1;
    }else{
      _blcisLoading.add(false);
      onFail();
      return 0;
    }
  }

  logout(){
    _user.email = '';
    _user.senha = '';
    _user.isLogged = false;
    _blcisLogged.add(false);
  }

  Future<bool> salvarLogin() async{
    if (!_user.isLogged){
      return false;
    }
    final storege = new FlutterSecureStorage();
    await storege.write(key: 'email', value: _user.email);
    await storege.write(key: 'senha', value: _user.senha);
    return true;
  }

  Future<Map<String,String>> carregarLogin() async{
    final storege = new FlutterSecureStorage();
    _user.email = (await storege.read(key: 'email'))!;
    _user.senha = (await storege.read(key: 'senha'))!;
    return {'email':_user.email, 'senha':_user.senha};
  }

  void renovarJWT() async{
    var response = await http.post(
      Uri.parse("${Utils.server_path}/Users/refreshToken.php"),
      body: json.encode({'jwt':jwt}),
      headers: {'Content-Type': 'application/json'},
    );
    try{
      var mapa = jsonDecode(response.body);
      _user.jwt = mapa['token'];
    } catch(e){}
  }
  String get uid => _user.id;
  String get jwt => _user.jwt!;
  String get nome=> _user.nome!;
}