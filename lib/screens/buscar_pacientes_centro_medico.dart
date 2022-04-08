import 'package:cuidados_fibrilacao_atrial/blocs/centro_medico_manager.dart';
import 'package:cuidados_fibrilacao_atrial/data/centro_medico.dart';
import 'package:flutter/material.dart';

class BuscarPacientesCentroMedicoScreen extends StatefulWidget {
  const BuscarPacientesCentroMedicoScreen({Key? key}) : super(key: key);

  @override
  State<BuscarPacientesCentroMedicoScreen> createState() => _BuscarPacientesCentroMedicoScreenState();
}

class _BuscarPacientesCentroMedicoScreenState extends State<BuscarPacientesCentroMedicoScreen> {
  CentroMedicoManager _centroMedicoManager = CentroMedicoManager();

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
                      print(id);
                  },
                );
              }
            else{
              return Container();
            }
            },
            future: _centroMedicoManager.getAll(),
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
