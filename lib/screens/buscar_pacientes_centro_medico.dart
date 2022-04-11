import 'package:cuidados_fibrilacao_atrial/blocs/centro_medico_manager.dart';
import 'package:cuidados_fibrilacao_atrial/blocs/exame_manager.dart';
import 'package:cuidados_fibrilacao_atrial/blocs/paciente_manager.dart';
import 'package:cuidados_fibrilacao_atrial/blocs/user_manager.dart';
import 'package:cuidados_fibrilacao_atrial/data/centro_medico.dart';
import 'package:cuidados_fibrilacao_atrial/data/paciente.dart';
import 'package:cuidados_fibrilacao_atrial/screens/visualizar_exames.dart';
import 'package:cuidados_fibrilacao_atrial/widgets/paciente_tile.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
class BuscarPacientesCentroMedicoScreen extends StatefulWidget {
  const BuscarPacientesCentroMedicoScreen({Key? key}) : super(key: key);

  @override
  State<BuscarPacientesCentroMedicoScreen> createState() => _BuscarPacientesCentroMedicoScreenState();
}

class _BuscarPacientesCentroMedicoScreenState extends State<BuscarPacientesCentroMedicoScreen> {
  CentroMedicoManager _centroMedicoManager = CentroMedicoManager();

  PacienteManager _pacienteManager = PacienteManager();
  ExameManager _exameManager = ExameManager();

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
  void dispose() {
    _pacienteManager.dispose();
    _exameManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atender Pacientes'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          FutureBuilder(builder: (context, snapshot) {
            if (snapshot.hasData) {
                return ComboCentroMedico(
                    lista: snapshot.data as List<CentroMedico>,
                  escolherCentro: (int id){
                    Map<String,dynamic> exameMapa = jsonDecode('{"valor":899,"foto":"624d9b5e69963.png","data":1649253287610}');

                    _pacienteManager.getPacientesCentroMedico(idCentroMedico: id);
                  },
                );
              }
            else{
              return Container();
            }
            },
            future: _centroMedicoManager.getAll(),
          ),
          StreamBuilder<List<Paciente>>(
            stream: _pacienteManager.listPacienteCentroMedico,
            builder: (context, snapshot) {
              if (!snapshot.hasData){
                return Container();
              }
              List<Paciente> lista = snapshot.data as List<Paciente>;

              return ListView.builder(
                shrinkWrap: true,
                itemCount: lista.length,
                itemBuilder: (context,item){

                  return PacienteTile(
                    paciente: lista[item],
                    visualizarExame: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>VisualizarExamesScreen(paciente: lista[item],))),
                    alterarMedicacao: (){},
                    marcarVisto: ()=>_exameManager.marcarTratadoExame(
                        exame: lista[item].ultimoExame!,
                        idUser: _userManager!.uid,
                        onSuccess: ()=>ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Exame marcado como visto!'),
                        )),
                        onFail: ()=>ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Falha na marcação!'),
                        ))
                    ),
                  );
                },
              );
            }
          ),
        ],
      ),
    );
  }
}

class ComboCentroMedico extends StatefulWidget {

  final List<CentroMedico>? lista;
  final void Function(int) escolherCentro;
  const ComboCentroMedico({required this.lista,required this.escolherCentro,Key? key}) : super(key: key);

  @override
  State<ComboCentroMedico> createState() => _ComboCentroMedicoState();
}

class _ComboCentroMedicoState extends State<ComboCentroMedico> {

  CentroMedicoManager _centroMedicoManager = CentroMedicoManager();
  CentroMedico? _centroMedico;

  @override
  Widget build(BuildContext context) {

    _centroMedico ??= widget.lista!.first;
    return DropdownButton<CentroMedico>(
          value: _centroMedico,
          onChanged: (CentroMedico? newValue){
            setState(() {
              _centroMedico = newValue ?? _centroMedico;

            });
            widget.escolherCentro(_centroMedico!.id!);
          },
          items: widget.lista!.map<DropdownMenuItem<CentroMedico>>((centromedico){
            return DropdownMenuItem(child: Text(centromedico.nome!),value: centromedico,);
          }).toList(),
        );

  }
}
