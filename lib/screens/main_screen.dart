import 'dart:async';
import 'package:cuidados_fibrilacao_atrial/data/user.dart';
import 'package:cuidados_fibrilacao_atrial/screens/orientacoes_gerais_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cuidados_fibrilacao_atrial/blocs/exame_manager.dart';
import 'package:cuidados_fibrilacao_atrial/blocs/medicamento_manager.dart';
import 'package:cuidados_fibrilacao_atrial/blocs/user_manager.dart';
import 'package:cuidados_fibrilacao_atrial/screens/associar_paciente_centromedico_screen.dart';
import 'package:cuidados_fibrilacao_atrial/screens/buscar_pacientes_centro_medico.dart';
import 'package:cuidados_fibrilacao_atrial/screens/chart_screen_equipe.dart';
import 'package:cuidados_fibrilacao_atrial/screens/chat_screen.dart';
import 'package:cuidados_fibrilacao_atrial/screens/enviar_exame.dart';
import 'package:cuidados_fibrilacao_atrial/screens/login_screen.dart';
import 'package:cuidados_fibrilacao_atrial/screens/minhas_medicacoes.dart';
import 'package:cuidados_fibrilacao_atrial/utils/notification_service.dart';
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
  NotificationService _notificationService = NotificationService();
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
        title: const Text('Fibrila????o Atrial'),
        centerTitle: true,
        actions: <Widget>[
          StreamBuilder<bool>(
            stream: _userManager!.isLogged,
            builder: (context, snapshot) {
              bool isLogged = snapshot.data ?? false;
              return IconButton(onPressed: (){
                    if (isLogged){
                      setState(() {
                        _userManager!.logout();
                      });

                    }
                    else{

                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginScreen())
                        ).then((value) => setState((){}));


                    }
              },
                  icon: isLogged ? const Icon(Icons.person) : const Icon(Icons.login),
                  tooltip: 'login');
            }
          ),
        ],
      ),
      body: formatoLinha(),
    );
  }
  Widget formatoLinha(){
    return ListView(
      padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
      children: [
       if (_userManager?.tipo == TipoUser.PACIENTE) tileMenu(
          click: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const EnviarExameScreen())),
          titulo: 'Enviar exame',
          img: "ico/clinic-history.png",
        ),
        if (_userManager?.tipo == TipoUser.PACIENTE)tileMenu(
          click: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const MinhasMedicacoesScreen())),
          titulo: 'Minhas medica????es',
          img: "ico/medicacao.png",
        ),
        if (_userManager?.tipo == TipoUser.MEDICO || _userManager?.tipo == TipoUser.ENFERMEIRO)tileMenu(
          click: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const BuscarPacientesCentroMedicoScreen())),
          titulo: 'Visualizar Pacientes',
          img: "ico/examination.png",
        ),
        if (_userManager?.tipo == TipoUser.PACIENTE)tileMenu(
          click: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const ChatScreen())),
          titulo: 'Orienta????es',
          img: "ico/orientacoes-pessoais.png",
        ),
        tileMenu(
            click:()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const OrientacoesGeraisScreen())),
          titulo: "Orienta????es Gerais",
          img: "ico/telemedicine.png"
        ),
      ],
    );
  }
  Widget tileMenu({required void click(), String img = '', String titulo = ''}){
    return InkWell(
      onTap: ()=>click(),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.asset(img,height: 75),
              const SizedBox(width: 10,),
              Text(titulo, style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
            ],
          ),
        ),
      ),
    );
  }
  Widget formatoGrid(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              child: Column(
                children: [
                  Image.asset("ico/clinic-history.png",height: 75),
                  const Text('Enviar exame'),
                ],
              ),
              onPressed:  ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const EnviarExameScreen())),
            ),

            TextButton(
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const MinhasMedicacoesScreen())),
              child: Column(
                children: [
                  Image.asset("ico/medicacao.png",height: 75,),
                  const Text('Minhas medica????es'),
                ],
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
                onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const BuscarPacientesCentroMedicoScreen())),
                child: Column(
                  children: [
                    Image.asset("ico/examination.png",height: 75,),
                    const Text('Visualizar Pacientes'),
                  ],
                )
            ),
            //https://www.flaticon.com/premium-icon/telemedicine_4430171?related_id=4430171
            TextButton(
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const ChatScreen())),
              child: Column(
                children: [
                  Image.asset("ico/orientacoes-pessoais.png",width: 90,),
                  const Text('Orienta????es'),
                ],
              ),
            )
          ],
        ),
        if (false)Row(
          children: [
            TextButton(
                onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const AssociarPacienteCentroMedicoScreen())),
                child: const Text('Associar Pacientes Centro M??dico')),
            TextButton(
                onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const ChatScreen())),
                child: const Text('Orienta????es')
            ),

          ],
        ),
        TextButton(
            onPressed: (){
              print('tempo armado');
              Timer tempo = Timer(const Duration(minutes: 10),(){
                MedicamentoManager mm = MedicamentoManager();
                mm.verificarAlteracaoMedicamento(idPaciente: _userManager!.uid, nomePaciente: _userManager!.nome);
              });

              Timer.periodic(Duration(seconds: 10), (timer) {
                MedicamentoManager mm = MedicamentoManager();
                mm.verificarAlteracaoMedicamento(idPaciente: _userManager!.uid, nomePaciente: _userManager!.nome);
              });

            },
            child: const Text('Teste Notificacao')
        ),
      ],
    );
  }
}
