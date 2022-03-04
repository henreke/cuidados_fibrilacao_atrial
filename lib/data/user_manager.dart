import 'package:cuidados_fibrilacao_atrial/utils/firebase_erros.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'user.dart';

class UserManager {

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> login({required Users user, required Function onFail, required Function onSuccess}) async{
    try
    {
      final UserCredential result = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.senha);
      onSuccess();
    } on FirebaseAuthException catch(e){
      print(e.code);
      onFail(getErrorString(e.code));
    }
  }
}