import 'dart:convert';
import 'dart:typed_data';

import 'package:cuidados_fibrilacao_atrial/blocs/exame_manager.dart';
import 'package:cuidados_fibrilacao_atrial/data/exame.dart';
import 'package:cuidados_fibrilacao_atrial/blocs/user_manager.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
class EnviarExameScreen extends StatefulWidget {
  const EnviarExameScreen({Key? key}) : super(key: key);

  @override
  State<EnviarExameScreen> createState() => _EnviarExameScreenState();
}

class _EnviarExameScreenState extends State<EnviarExameScreen> {

  UserManager? _userManager;
  String _baseimage = '';
  String _extensao = '';
  ExameManager _exameManager = ExameManager();


  @override
  void dispose() {
    _exameManager.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final UserManager userManager = Provider.of<UserManager>(context);
    if (_userManager != userManager) {
      _userManager = userManager;
    }
  }

  final ImagePicker _picker = ImagePicker();
  DateTime selectedDate = DateTime.now();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController dataController = TextEditingController();
  final TextEditingController valorController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    dataController.text = DateFormat('dd/MM/yyyy').format(selectedDate);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enviar Exame'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formkey,
            child: StreamBuilder<bool>(
              stream: _exameManager.isLoading,
              builder: (context, snapshot) {
                bool isLoading = snapshot.data ?? false;
                return ListView(
                  padding: const EdgeInsets.all(16),
                  shrinkWrap: true,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Data do Exame:'),
                      controller: dataController,
                      readOnly: true,
                      enabled: !isLoading,
                      onTap: ()=>_selectDate(context),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Valor do Resultado:'),
                      controller: valorController,
                      keyboardType: TextInputType.number,
                      enabled: !isLoading,
                    ),
                    SizedBox(height: 10,),
                    ElevatedButton(onPressed: isLoading ? null : () async{
                      XFile? foto = await _picker.pickImage(source: ImageSource.gallery);
                      final imageBytes =  await foto!.readAsBytes();
                      _baseimage = base64.encode(imageBytes);
                      _extensao = foto.name.substring(foto.name.length-3);
                      if (foto.name.isNotEmpty){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Foto carregada com sucesso!'),
                        ));
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Falha ao carregar foto!'),
                        ));
                      }

                    },
                        child: const Text('Carregar foto da galeria'),
                      style: ButtonStyle(
                          textStyle: MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.pressed)){
                              return TextStyle(color: Colors.black);
                            }
                            return TextStyle(color: Colors.white);
                          }),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                          backgroundColor: MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.pressed)){
                              return Colors.green[50];
                            }
                            return Theme.of(context).primaryColor;
                          })
                      ),
                    ),
                    SizedBox(height: 10,),
                    ElevatedButton(onPressed: isLoading ? null : () async{
                      XFile? foto = await _picker.pickImage(source: ImageSource.camera);
                      final imageBytes =  await foto!.readAsBytes();
                      _baseimage = base64.encode(imageBytes);
                      _extensao = foto.name.substring(foto.name.length-3);
                      if (foto.name.isNotEmpty){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Foto carregada com sucesso!'),
                        ));
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Falha ao carregar foto!'),
                        ));
                      }

                    },
                      child: const Text('Abrir câmera para tirar foto'),
                      style: ButtonStyle(
                          textStyle: MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.pressed)){
                              return TextStyle(color: Colors.black);
                            }
                            return TextStyle(color: Colors.white);
                          }),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                          backgroundColor: MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.pressed)){
                              return Colors.green[50];
                            }
                            return Theme.of(context).primaryColor;
                          })
                      ),
                    ),
                    SizedBox(height: 10,),
                    ElevatedButton(
                        style: ButtonStyle(
                          textStyle: MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.pressed)){
                              return TextStyle(color: Colors.black);
                            }
                            return TextStyle(color: Colors.white);
                          }),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                          backgroundColor: MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.pressed)){
                              return Colors.green[50];
                            }
                            return Theme.of(context).primaryColor;
                          })
                        ),
                        onPressed: isLoading ? null : (){
                      Exame exame = Exame(idUser: _userManager!.uid,foto: _baseimage,extensao: _extensao,data: selectedDate.millisecondsSinceEpoch,valor: int.parse(valorController.text));

                      _exameManager.cadExame(exame: exame, onSuccess: (){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Exame Enviado com sucesso!'),
                        ));
                        _baseimage = '';
                        _extensao = '';
                        valorController.text = '';

                      }, onFail: (){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Falha ao enviar exame, verifique seu sinal do celular!'),
                        ));
                      });
                    },
                        child: isLoading ? const Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          ),
                        ): const Text('Enviar')),
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );

  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2022, 1),
        lastDate: DateTime(2032));
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      dataController.text = DateFormat('dd/MM/yyyy').format(selectedDate);

    }
  }
}
