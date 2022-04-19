import 'package:cuidados_fibrilacao_atrial/blocs/exame_manager.dart';
import 'package:cuidados_fibrilacao_atrial/blocs/user_manager.dart';
import 'package:cuidados_fibrilacao_atrial/screens/associar_paciente_centromedico_screen.dart';
import 'package:cuidados_fibrilacao_atrial/screens/buscar_pacientes_centro_medico.dart';
import 'package:cuidados_fibrilacao_atrial/screens/chart_screen_equipe.dart';
import 'package:cuidados_fibrilacao_atrial/screens/chat_screen.dart';
import 'package:cuidados_fibrilacao_atrial/screens/enviar_exame.dart';
import 'package:cuidados_fibrilacao_atrial/screens/login_screen.dart';
import 'package:cuidados_fibrilacao_atrial/screens/minhas_medicacoes.dart';
import 'package:cuidados_fibrilacao_atrial/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  UserManager? _userManager;

  ExameManager _exameManager = ExameManager();

  @override
  void initState() {
    super.initState();
    if (Utils.valorExameAlto == -1){
      _exameManager.getParamExame();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final UserManager userManager = Provider.of<UserManager>(context);
    if (_userManager != userManager) {
      _userManager = userManager;
    }
  }

  @override
  void dispose() {
    _exameManager.dispose();
    super.dispose();
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
                TextButton(
                    onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const MinhasMedicacoesScreen())),
                    child: const Text('Minhas medicações'))
              ],
            ),
            Row(
              children: [
                TextButton(
                    onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const BuscarPacientesCentroMedicoScreen())),
                    child: const Text('Visualizar Pacientes')),
                TextButton(
                    onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const ChatScreen())),
                    child: const Text('Orientações')),
              ],
            ),
            Row(
              children: [
                TextButton(
                    onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const AssociarPacienteCentroMedicoScreen())),
                    child: const Text('Associar Pacientes Centro Médico')),
                TextButton(
                    onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const ChatScreen())),
                    child: const Text('Orientações')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
