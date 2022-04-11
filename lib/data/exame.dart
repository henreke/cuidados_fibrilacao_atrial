class Exame{

  late int? id;
  late String? idUser;
  late String? foto;
  late String? extensao;
  late int? data;
  late int? valor;
  late int? tratado;
  late int? data_tratado;

  Exame({this.id,this.idUser, this.foto, this.extensao, this.data, this.valor,this.tratado,this.data_tratado});

  toJson() => {'idUser':this.idUser,'foto':this.foto,'extensao':this.extensao,'data':this.data,'valor':this.valor};
}