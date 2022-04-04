import 'package:cuidados_fibrilacao_atrial/data/user.dart';
import 'package:cuidados_fibrilacao_atrial/data/user_manager.dart';
import 'package:cuidados_fibrilacao_atrial/utils/validators.dart';
import 'package:flutter/material.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrar'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formkey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              children: [
                TextFormField(
                  decoration: const InputDecoration(hintText: 'e-mail'),
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  controller: emailController,
                  validator: (email){
                    if (!emailValid(email)){
                      return 'e-mail inválido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'senha'),
                  autocorrect: false,
                  obscureText: true,
                  controller: senhaController,
                  validator: (senha){
                    if (senha!.isEmpty || senha.length < 6) {
                      return 'senha inválida';
                    }
                    return null;
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child:TextButton(
                    onPressed: (){},
                    child: const Text('Esqueci minha senha'),
                  ),
                ),
                const SizedBox(height: 16,),
                ElevatedButton(
                    onPressed: (){
                      if (formkey.currentState!.validate()){
                          Users user = Users(email: emailController.text, senha: senhaController.text);
                          UserManager userm = UserManager();
                          userm.login(user: user,onFail:  (){},onSuccess: ()=>print('sucesso'));
                      }
                    },
                    child: const Text('Entrar',style: TextStyle(fontSize: 18),)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
