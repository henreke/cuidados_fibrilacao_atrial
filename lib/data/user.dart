class Users{
  late String email;
  late String senha;
  late String nome;
  late int tipo;

  Users({required this.email, required this.senha, nome, tipo});
}

class TipoUser{
  static int PACIENTE = 1;
  static int MEDICO = 2;
  static int ENFERMEIRO = 3;
}