import 'package:cuidados_fibrilacao_atrial/data/user.dart';
import 'package:cuidados_fibrilacao_atrial/blocs/user_manager.dart';
import 'package:cuidados_fibrilacao_atrial/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CadUserScreen extends StatefulWidget {
  const CadUserScreen({Key? key}) : super(key: key);

  @override
  State<CadUserScreen> createState() => _CadUserScreenState();
}

class _CadUserScreenState extends State<CadUserScreen> {

  UserManager? _userManager;


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final UserManager userManager = Provider.of<UserManager>(context);
    if (_userManager != userManager) {
      _userManager = userManager;
    }
  }

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmacaoSenhaController = TextEditingController();
  int _tipoUsuario = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Usuário'),
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
                      decoration: const InputDecoration(labelText: 'Nome:'),
                      enabled: !_isLoading,
                      autocorrect: false,
                      controller: nomeController,
                      validator: (nome){
                        if (nome!.isEmpty){
                          return 'Preencha seu nome';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'e-mail'),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      enabled: !_isLoading,
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
                      decoration: const InputDecoration(labelText: 'senha'),
                      autocorrect: false,
                      enabled: !_isLoading,
                      obscureText: true,
                      controller: senhaController,
                      validator: (senha){
                        if (senha!.isEmpty || senha.length < 6) {
                          return 'senha inválida';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'confirmação de senha'),
                      autocorrect: false,
                      obscureText: true,
                      enabled: !_isLoading,
                      controller: confirmacaoSenhaController,
                      validator: (senha){
                        if (senha!.isEmpty || senha.length < 6) {
                          return 'senha inválida';
                        }
                        if (senha != senhaController.text) {
                          return 'senhas não são iguais';
                        }
                        return null;
                      },
                    ),
                    Row(
                      children: [
                        ChoiceChip(
                          label: const Text('Paciente'),
                          selected: TipoUser.PACIENTE == _tipoUsuario,
                          onSelected: (bool value){
                              setState(() {
                                _tipoUsuario = TipoUser.PACIENTE;
                              });
                          },
                        ),
                        ChoiceChip(
                          label: const Text('Médica(o)'),
                          selected: TipoUser.MEDICO == _tipoUsuario,
                          onSelected: (bool value){
                              setState(() {
                                _tipoUsuario = TipoUser.MEDICO;
                              });
                          },
                        ),
                        ChoiceChip(
                          label: const Text('Enfermeira(o)'),
                          selected: TipoUser.ENFERMEIRO == _tipoUsuario,
                          onSelected: (bool value){
                              setState(() {
                                _tipoUsuario = TipoUser.ENFERMEIRO;
                              });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16,),
                    ElevatedButton(
                        onPressed: _isLoading ? null :  () async{
                          if (formkey.currentState!.validate()){

                            Users user = Users(email: emailController.text, senha: senhaController.text,nome: nomeController.text,tipo: _tipoUsuario,dtnascimento: 0);
                            int valor = await _userManager!.cadUser(onSuccess: (){
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text('Cadastro Efetuado com sucesso!'),
                              ));
                            }, onFail: (String falha){
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(falha,style: const TextStyle(color: Colors.black),),

                              ));
                            }, user: user);


                          }
                        },
                        child: _isLoading ? const Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          ),
                        ) : const Text('Cadastrar',style: TextStyle(fontSize: 18),)
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
