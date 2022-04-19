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
  late String? jwt;

  Users({required this.email, required this.senha, this.nome, this.tipo,this.dtnascimento,this.jwt});

  Map<String,dynamic> toJson() => {"nome":nome,"email":email, "senha":senha,"tipo":tipo,"dtnascimento":dtnascimento};

}

class TipoUser{
  static int PACIENTE = 1;
  static int MEDICO = 2;
  static int ENFERMEIRO = 3;
}