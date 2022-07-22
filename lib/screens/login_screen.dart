import 'package:cuidados_fibrilacao_atrial/data/user.dart';
import 'package:cuidados_fibrilacao_atrial/blocs/user_manager.dart';
import 'package:cuidados_fibrilacao_atrial/screens/cad_user_screen.dart';
import 'package:cuidados_fibrilacao_atrial/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  UserManager? _userManager;


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final UserManager userManager = Provider.of<UserManager>(context);
    if (_userManager != userManager) {
      _userManager = userManager;
      _userManager?.carregarLogin().then((infoLogin){
        emailController.text = infoLogin['email']!;
        senhaController.text = infoLogin['senha']!;
      } );

    }
  }



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
            child: StreamBuilder<bool>(
              stream: _userManager!.isLoading,
              builder: (context, snapshot) {
                bool _isLoading = snapshot.hasData ? snapshot.data! : false;
                return ListView(
                  padding: const EdgeInsets.all(16),
                  shrinkWrap: true,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(hintText: 'e-mail'),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      controller: emailController,
                      enabled: !_isLoading,
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
                      enabled: !_isLoading,
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
                        onPressed: (){
                                _userManager!.recuperarSenha(
                                    email: emailController.text,
                                    onSuccess: ()=>ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                      content: Text('Enviado e-mail com sua nova senha, verifique também sua caixa de spam.',style: TextStyle(color: Colors.black),),

                                    )),
                                    onFail: ()=>ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                      content: Text('esse e-mail não está cadastrado.',style: TextStyle(color: Colors.black),),

                                    ))
                                );
                        },
                        child: const Text('Esqueci minha senha'),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child:TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CadUserScreen()));
                        },
                        child: const Text('Cadastar'),
                      ),
                    ),
                    const SizedBox(height: 16,),
                    ElevatedButton(
                        onPressed: _isLoading ? null : (){
                          if (formkey.currentState!.validate()){
                              Users user = Users(email: emailController.text, senha: senhaController.text);
                              _userManager!.login(user: user,onFail:  (){
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text('Falha no login senha ou e-mail errado.',),

                                ));
                              },onSuccess: (){
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text('Login efetuado com sucesso.',),
                                  backgroundColor: Colors.green,

                                )
                                );
                                Navigator.pop(context);
                              }
                              );
                          }
                        },
                        child: _isLoading ? const Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          ),
                        ) : const Text('Entrar',style: TextStyle(fontSize: 18),)
                    ),
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
