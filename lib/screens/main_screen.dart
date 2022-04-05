import 'package:cuidados_fibrilacao_atrial/data/user_manager.dart';
import 'package:cuidados_fibrilacao_atrial/screens/enviar_exame.dart';
import 'package:cuidados_fibrilacao_atrial/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  UserManager? _userManager;


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final UserManager userManager = Provider.of<UserManager>(context);
    if (_userManager != userManager) {
      _userManager = userManager;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fibrilação Atrial'),
        centerTitle: true,
        actions: <Widget>[
          StreamBuilder<bool>(
            stream: _userManager!.isLogged,
            builder: (context, snapshot) {
              bool isLogged = snapshot.data ?? false;
              return IconButton(onPressed: (){
                    if (isLogged){
                        _userManager!.logout();
                    }
                    else{
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen())
                      );
                    }
              },
                  icon: isLogged ? const Icon(Icons.person) : const Icon(Icons.login),
                  tooltip: 'login');
            }
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                TextButton(
                    onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const EnviarExameScreen())),
                    child: const Text('Enviar exame')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
