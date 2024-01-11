import 'package:flutter/material.dart';

class Chads{
  String obs;
  int data;
  int id;

  Chads({this.obs = '',this.data = 0,this.id = 0,required this.idPaciente, this.valor = 0});

  String idPaciente;
  int valor;

  void setValorFromList(List<bool> lista){
    String numero = '';
    for (int i= 0; i < lista.length; i++){
      lista[i] ? numero+='1' : numero+='0';
    }
    this.valor = int.parse(numero,radix: 2);
  }

  List<bool> getListFromValor(){
    String plist = valor.toRadixString(2);
    List<bool> retorno = [];
    plist.characters.forEach((element)=>retorno.add(element == '1'));

    return retorno;
  }

  toJson() => {
    'idPaciente': this.idPaciente,
    'valor': this.valor,
    'obs': this.obs,
  };
}