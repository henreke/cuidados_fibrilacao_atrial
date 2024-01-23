import 'package:cuidados_fibrilacao_atrial/blocs/medicamento_manager.dart';
import 'package:cuidados_fibrilacao_atrial/blocs/user_manager.dart';
import 'package:cuidados_fibrilacao_atrial/data/paciente.dart';
import 'package:cuidados_fibrilacao_atrial/widgets/medicamento_tileEdicao.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/medicamento.dart';


class AlterarMedicamentoScreen extends StatefulWidget {

  final Paciente paciente;
  const AlterarMedicamentoScreen({Key? key, required this.paciente}) : super(key: key);

  @override
  State<AlterarMedicamentoScreen> createState() => _AlterarMedicamentoScreenState();
}

class _AlterarMedicamentoScreenState extends State<AlterarMedicamentoScreen> {
  
  MedicamentoManager _medicamentoManager = MedicamentoManager();
  List<MedicamentoPaciente> lista_medicamentos = <MedicamentoPaciente>[];
  UserManager? _userManager;
  Medicamento? _medicamentoEscolhido;
  final TextEditingController doseController = TextEditingController();
  final TextEditingController frequenciaController = TextEditingController();
  final TextEditingController doseController2 = TextEditingController();
  final TextEditingController frequenciaController2 = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final GlobalKey<FormState> formkey2 = GlobalKey<FormState>();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final UserManager userManager = Provider.of<UserManager>(context);
    if (_userManager != userManager) {
      _userManager = userManager;
      print(widget.paciente.uid);
      _medicamentoManager.getMedicamentosPacienteAtual(idPaciente: widget.paciente.uid!);
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
        title: const Text('Alterar Medicamento'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(

        child: Column(
          children: [
            const Text('Paciente:'),
            Text(widget.paciente.nome!),
            Text('Resultado do último exame: ${widget.paciente.ultimoExame!.valor}'),
            StreamBuilder<List<MedicamentoPaciente>>(
              stream: _medicamentoManager.listMedicamentosPaciente,
              builder: (context, snapshot) {
                if (snapshot.hasData || snapshot.data != null) {
                  lista_medicamentos = snapshot.data!;
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(8),
                      itemCount: lista_medicamentos.length,
                      shrinkWrap: true,
                      itemBuilder: (context, item) {
                        return MedicamentosTileEdicao(
                          data: lista_medicamentos[item].data,
                          dose: lista_medicamentos[item].dose,
                          nome: lista_medicamentos[item].medicamento!.nome,
                          nome_medico:  lista_medicamentos[item].nome_medico,
                          frequencia: lista_medicamentos[item].frequencia,
                          dose_tomadas: lista_medicamentos[item].dose_tomada,
                          alterarMedicacao: (){
                            _showSheetEdicao(context,(){
                              if (formkey.currentState!.validate()) {
                                  _medicamentoManager.alterarMedicacao(
                                    idMedicamentoPacienteAnterior: lista_medicamentos[item].id,
                                      idMedicamento: lista_medicamentos[item]
                                          .medicamento!
                                          .id!,
                                      dose: int.parse(doseController.text),
                                      frequencia:
                                          int.parse(frequenciaController.text),
                                      idPaciente: widget.paciente.uid!,
                                      idUser: _userManager!.uid,
                                      jwt: _userManager!.jwt,
                                      onSuccess: () {
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                          content: Text('Medicamento alterado com sucesso!'),
                                        ));
                                        _medicamentoManager.getMedicamentosPacienteAtual(idPaciente: widget.paciente.uid!);
                                      },
                                      onFail: () {});
                                }
                              });
                          },
                          excluirMedicacao: (){
                            _medicamentoManager.excluirMedicacao(
                                idUser: _userManager!.uid,
                                idMedicamentoPaciente: lista_medicamentos[item].id!,
                                onSuccess: (){
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text('Medicamento exlcuído com sucesso!'),
                                  ));
                                  _medicamentoManager.getMedicamentosPacienteAtual(idPaciente: widget.paciente.uid!);
                                },
                                onFail: (){});
                          },
                        );
                      });
                } else{
                  return Container();
                }
              }
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>_showSheetNovo(context, () {
              if (formkey2.currentState!.validate()){
                _medicamentoManager.alterarMedicacao(
                    idMedicamento: _medicamentoEscolhido?.id ?? 0,
                    dose: int.parse(doseController2.text),
                    frequencia:
                    int.parse(frequenciaController2.text),
                    idPaciente: widget.paciente.uid!,
                    idUser: _userManager!.uid,
                    jwt: _userManager!.jwt,
                    onSuccess: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Medicamento alterado com sucesso!'),
                      ));
                      _medicamentoManager.getMedicamentosPacienteAtual(idPaciente: widget.paciente.uid!);
                    },
                    onFail: () {});
              }
        }),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showSheetEdicao(context, void Function() alterar){
    showModalBottomSheet<dynamic>(
      elevation: 20,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        enableDrag: true,
        context: context,
        builder: (context){
          return Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: formkey,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Nova Dose:'),
                            controller: doseController,
                            keyboardType: TextInputType.number,
                          validator: (valor){
                            if (valor!.isEmpty){
                              return 'Preencha a Dose!';
                            } else{
                              return null;
                            }
                          },
                        ),
                        TextFormField(
                            decoration: const InputDecoration(labelText: 'Posologia:'),
                            controller: frequenciaController,
                            keyboardType: TextInputType.number,
                            validator: (valor){
                              if (valor!.isEmpty){
                                return 'Preencha a Posologia!';
                              } else{
                                return null;
                              }
                            },
                        ),
                        TextButton(
                            onPressed: ()=>alterar(), child: const Text('Salvar',style: TextStyle(fontSize: 14),)),
                        SizedBox(height: MediaQuery.of(context).size.height*0.5,),
                      ],
                    ),
                  ),
                ),
            ),
              ),
          ]
          );
        });
  }

  void _showSheetNovo(context, void Function() novo){
    _medicamentoManager.getMedicamentos().then((List<Medicamento> listaMedicamentos){
      showModalBottomSheet<dynamic>(
          elevation: 20,
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          enableDrag: true,
          context: context,
          builder: (context){
            return Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Form(
                          key: formkey2,
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              DropdownButtonFormField<Medicamento>(

                                  items: listaMedicamentos.map<DropdownMenuItem<Medicamento>>((e) => DropdownMenuItem(child: Text(e.nome!),value: e,)).toList(),
                                  validator: (valor){
                                    if (_medicamentoEscolhido == null){
                                      return 'Escolha o medicamento!';
                                    }else{
                                      return null;
                                    }
                                  },
                                  onChanged:(valor){
                                    _medicamentoEscolhido = valor;
                                  },
                                  ),
                              TextFormField(
                                decoration: const InputDecoration(labelText: 'Nova Dose:'),
                                controller: doseController2,
                                keyboardType: TextInputType.number,
                                validator: (valor){
                                  if (valor!.isEmpty){
                                    return 'Preencha a Dose!';
                                  } else{
                                    return null;
                                  }
                                },
                              ),
                              TextFormField(
                                decoration: const InputDecoration(labelText: 'Posologia:'),
                                controller: frequenciaController2,
                                keyboardType: TextInputType.number,
                                validator: (valor){
                                  if (valor!.isEmpty){
                                    return 'Preencha a Posologia!';
                                  } else{
                                    return null;
                                  }
                                },
                              ),
                              TextButton(
                                  onPressed: ()=>novo(), child: const Text('Salvar',style: TextStyle(fontSize: 14),)),
                              SizedBox(height: MediaQuery.of(context).size.height*0.5,),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ]
            );
          });
    });

  }
}



