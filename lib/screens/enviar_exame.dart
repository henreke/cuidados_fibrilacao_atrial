import 'dart:convert';
import 'dart:typed_data';

import 'package:cuidados_fibrilacao_atrial/blocs/exame_manager.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

class EnviarExameScreen extends StatefulWidget {
  const EnviarExameScreen({Key? key}) : super(key: key);

  @override
  State<EnviarExameScreen> createState() => _EnviarExameScreenState();
}

class _EnviarExameScreenState extends State<EnviarExameScreen> {

  final ImagePicker _picker = ImagePicker();
  DateTime selectedDate = DateTime.now();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController dataController = TextEditingController();
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
            child: ListView(
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Data do Exame:'),
                  controller: dataController,
                  readOnly: true,
                  onTap: ()=>_selectDate(context),
                ),
                TextButton(onPressed: () async{
                  XFile? foto = await _picker.pickImage(source: ImageSource.gallery);

                  final imageBytes =  await foto!.readAsBytes();
                  String baseimage = base64.encode(imageBytes);
                  print(foto.name);
                  ExameManager exame = ExameManager(uid: '',foto: baseimage,extensao: (foto.name.substring(foto.name.length-3)));
                  exame.enviarFoto();
                },
                    child: const Text('Abrir foto')),
                TextButton(onPressed: (){

                },
                    child: const Text('Enviar')),
              ],
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
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      dataController.text = DateFormat('dd/MM/yyyy').format(selectedDate);

    }
  }
}
