String getErrorString(String code){
  switch (code) {
    case 'WEAK-PASSWORD':
      return 'Sua senha é muito fraca.';
    case 'INVALID-EMAIL':
      return 'Seu e-mail é inválido.';
    case 'EMAIL-ALREADY-IN-USE':
      return 'E-mail já está sendo utilizado em outra conta.';
    case 'INVALID-CREDENTIAL':
      return 'Seu e-mail é inválido.';
    case 'WRONG-PASSWORD':
      return 'Sua senha está incorreta.';
    case 'USER-NOT-FOUND':
      return 'Não há usuário com este e-mail.';
    case 'USER-DISABLED':
      return 'Este usuário foi desabilitado.';
    case 'TOO-MANY-REQUESTS':
      return 'Muitas solicitações. Tente novamente mais tarde.';
    case 'OPERATION-NOT-ALLOWED':
      return 'Operação não permitida.';

    default:
      return 'Um erro indefinido ocorreu.';
  }
}