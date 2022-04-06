import 'package:cuidados_fibrilacao_atrial/blocs/medicamento_manager.dart';
import 'package:flutter/material.dart';

class MinhasMedicacoesScreen extends StatefulWidget {
  const MinhasMedicacoesScreen({Key? key}) : super(key: key);

  @override
  State<MinhasMedicacoesScreen> createState() => _MinhasMedicacoesScreenState();
}

class _MinhasMedicacoesScreenState extends State<MinhasMedicacoesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Medicações'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: TextButton(child: const Text('clqiue'),onPressed: (){
          MedicamentoManager _mManager = MedicamentoManager();
          _mManager.getMedicamentos();
        },),
      ),
    );
  }
}
