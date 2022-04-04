import 'package:cuidados_fibrilacao_atrial/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
class Users{
  late String email;
  late String senha;
  late String? nome = '';
  late int? tipo = 0;
  late int? dtnascimento = 0;
  late String id = '';
  bool isLogged = false;

  Users({required this.email, required this.senha, this.nome, this.tipo,this.dtnascimento});

  Map<String,dynamic> toJson() => {"nome":nome,"email":email, "senha":senha,"tipo":tipo,"dtnascimento":dtnascimento};

  Future<int> cadUser({required VoidCallback onSuccess, required VoidCallback onFail}) async {
    print(toJson());
    var response = await http.post(
      Uri.parse("${Utils.server_path}/Users/loginJWT.php"),
      body: json.encode(toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    var mapa = jsonDecode(response.body);
    var sucesso = mapa['success'];
    switch (sucesso) {
      case 0:
        break;
      case 1:
        print('sucesso');
        //await Login();
        //this.islogged = true;
        break;
      case 2:
        break;
    }
    return sucesso;

  }
}

class TipoUser{
  static int PACIENTE = 1;
  static int MEDICO = 2;
  static int ENFERMEIRO = 3;
}