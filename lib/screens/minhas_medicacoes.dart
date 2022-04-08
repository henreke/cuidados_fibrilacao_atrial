import 'package:cuidados_fibrilacao_atrial/blocs/medicamento_manager.dart';
import 'package:cuidados_fibrilacao_atrial/blocs/user_manager.dart';
import 'package:cuidados_fibrilacao_atrial/data/medicamento.dart';
import 'package:cuidados_fibrilacao_atrial/widgets/medicamento_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class MinhasMedicacoesScreen extends StatefulWidget {
  const MinhasMedicacoesScreen({Key? key}) : super(key: key);

  @override
  State<MinhasMedicacoesScreen> createState() => _MinhasMedicacoesScreenState();
}

class _MinhasMedicacoesScreenState extends State<MinhasMedicacoesScreen> {

  MedicamentoManager _medicamentoManager = MedicamentoManager();
  List<MedicamentoPaciente> lista_medicamentos = <MedicamentoPaciente>[];
  UserManager? _userManager;


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final UserManager userManager = Provider.of<UserManager>(context);
    if (_userManager != userManager) {
      _userManager = userManager;
      _medicamentoManager.getMedicamentosPacienteAtual(idPaciente: _userManager!.uid);
    }
  }


  @override
  void dispose() {
    _medicamentoManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Medicações'),
        centerTitle: true,
      ),
      body: ListView(
          children: [
            StreamBuilder<List<MedicamentoPaciente>>(
              stream: _medicamentoManager.listMedicamentosPaciente,
              builder: (context, snapshot) {
                if (snapshot.hasData || snapshot.data != null) {
                  lista_medicamentos = snapshot.data!;
                  return ListView.builder(
                    padding: const EdgeInsets.all(8),
                      itemCount: lista_medicamentos.length,
                      shrinkWrap: true,
                      itemBuilder: (context, item) {
                        return MedicamentosTile(
                          data: lista_medicamentos[item].data,
                          dose: lista_medicamentos[item].dose,
                          nome: lista_medicamentos[item].medicamento!.nome,
                          nome_medico:  lista_medicamentos[item].nome_medico,
                          frequencia: lista_medicamentos[item].frequencia,
                          dose_tomadas: lista_medicamentos[item].dose_tomada,
                          tomarMedicacao: (){
                            _medicamentoManager.tomarMedicacao(
                                idMedicamentoPaciente: lista_medicamentos[item].id!,
                                idPaciente: _userManager!.uid,
                                onSuccess: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Anotado!'),
                                      ));
                                  _medicamentoManager.getMedicamentosPacienteAtual(idPaciente: _userManager!.uid);
                                },
                                onFail: ()=>ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text('Ocorreu uma falha, verifique sua conexão com a internet',style: TextStyle(color: Colors.black),),

                                )));
                          },
                        );
                      });
                } else{
                  return Container();
                }
              }
            ),
          ],
        ),

    );
  }
}
