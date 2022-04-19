import 'package:cuidados_fibrilacao_atrial/blocs/centro_medico_manager.dart';
import 'package:cuidados_fibrilacao_atrial/blocs/exame_manager.dart';
import 'package:cuidados_fibrilacao_atrial/blocs/paciente_manager.dart';
import 'package:cuidados_fibrilacao_atrial/blocs/user_manager.dart';
import 'package:cuidados_fibrilacao_atrial/data/centro_medico.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class AssociarPacienteCentroMedicoScreen extends StatefulWidget {
  const AssociarPacienteCentroMedicoScreen({Key? key}) : super(key: key);

  @override
  State<AssociarPacienteCentroMedicoScreen> createState() => _AssociarPacienteCentroMedicoScreenState();
}

class _AssociarPacienteCentroMedicoScreenState extends State<AssociarPacienteCentroMedicoScreen> {

  CentroMedicoManager _centroMedicoManager = CentroMedicoManager();

  PacienteManager _pacienteManager = PacienteManager();
  ExameManager _exameManager = ExameManager();

  UserManager? _userManager;

  List<CentroMedico> _listacentromedico = <CentroMedico>[];

  @override
  void initState() {
    super.initState();
    _centroMedicoManager.getAll().then((lista) {
      setState(() {
        print('associando lista');
        _listacentromedico = lista;
      });

    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final UserManager userManager = Provider.of<UserManager>(context);
    if (_userManager != userManager) {
      _userManager = userManager;
    }
  }

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Associar Paciente a Centro Médico'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formkey,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Text('Escolha o Centro Médico que será associado'),
                    DropdownButtonFormField<CentroMedico>(
                        items: _listacentromedico.map<DropdownMenuItem<CentroMedico>>((e) => DropdownMenuItem(child: Text(e.nome!),value: e,)).toList(),
                        onChanged: (valor){}),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),

    );
  }
}
