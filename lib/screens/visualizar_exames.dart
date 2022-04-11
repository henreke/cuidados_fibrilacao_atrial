import 'dart:convert';

import 'package:cuidados_fibrilacao_atrial/blocs/exame_manager.dart';
import 'package:cuidados_fibrilacao_atrial/blocs/user_manager.dart';
import 'package:cuidados_fibrilacao_atrial/data/paciente.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
class VisualizarExamesScreen extends StatefulWidget {

  final Paciente? paciente;
  const VisualizarExamesScreen({Key? key, this.paciente}) : super(key: key);

  @override
  State<VisualizarExamesScreen> createState() => _VisualizarExamesScreenState();
}

class _VisualizarExamesScreenState extends State<VisualizarExamesScreen> {

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController valorController = TextEditingController();
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
    _exameManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    valorController.text = widget.paciente!.ultimoExame!.valor.toString();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visualizar Exames'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        shrinkWrap: true,
        children: [
          Text('Paciente: ${widget.paciente!.nome ?? ''}'),
          GestureDetector(
            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>ZoomExame(imagem: widget.paciente!.ultimoExame!.foto!,))),
              child: Image.memory(base64Decode(widget.paciente!.ultimoExame!.foto!),height:  MediaQuery.of(context).size.height*0.70)
          ),
          Form(
            key: formkey,
            child: StreamBuilder<bool>(
              stream: _exameManager.isLoading,
              builder: (context, snapshot) {
                bool isLoading = snapshot.data ?? false;
                return Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Resultado do Exame'),
                      keyboardType: TextInputType.number,
                      enabled: !isLoading,
                      onEditingComplete: ()=>widget.paciente!.ultimoExame!.valor = int.parse(valorController.text),
                      controller: valorController,
                      validator: (valor){
                        return valor!.isEmpty ? 'Digite um valor' : null;
                      },
                    ),
                    TextButton(onPressed: (){
                      if(formkey.currentState!.validate()){
                        widget.paciente!.ultimoExame!.valor = int.parse(valorController.text);
                          _exameManager.updateValorExame(
                              exame: widget.paciente!.ultimoExame!,
                              idUser: _userManager!.uid,
                              onSuccess: ()=>ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text('Exame atualizado com sucesso!'),
                              )),
                              onFail:()=>ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text('Falha na atualização do exame!'),
                              )));
                      }
                    }, child: isLoading ? const CircularProgressIndicator() : const Text('Salvar Resultado'),)
                  ],
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}

class ZoomExame extends StatelessWidget {

  final String? imagem;
  const ZoomExame({this.imagem,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: PhotoView(
        imageProvider: MemoryImage(base64Decode(imagem!)),

      ),
    );
  }
}

