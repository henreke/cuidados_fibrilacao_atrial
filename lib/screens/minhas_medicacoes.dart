import 'package:cuidados_fibrilacao_atrial/blocs/medicamento_manager.dart';
import 'package:cuidados_fibrilacao_atrial/blocs/user_manager.dart';
import 'package:cuidados_fibrilacao_atrial/data/m.dart';
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
      _medicamentoManager.getMedicamentosPacienteAtual(idPaciente: _userManager!.uid).then((lista) => lista_medicamentos = lista);
    }
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
            TextButton(child: const Text('clqiue'),onPressed: (){
              MedicamentoManager _mManager = MedicamentoManager();
              _mManager.getMedicamentos();
            },),
            ListView.builder(
                itemCount: lista_medicamentos.length,
                shrinkWrap: true,
                itemBuilder: (context,item){
                  return MedicamentosTile(
                    data: lista_medicamentos[item].data,
                    dose: lista_medicamentos[item].dose,
                    nome: lista_medicamentos[item].medicamento!.nome,
                    frequencia: lista_medicamentos[item].frequencia,
                  );
                }
            ),
          ],
        ),

    );
  }
}
