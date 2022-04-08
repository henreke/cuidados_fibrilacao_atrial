import 'package:cuidados_fibrilacao_atrial/data/user.dart';
import 'package:cuidados_fibrilacao_atrial/utils/utils.dart';
import 'package:flutter/material.dart';

class PacienteTile extends StatelessWidget {

  final Users? paciente;
  const PacienteTile({this.paciente,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(paciente!.nome ?? ''),
              ],
            )
          ],
        ),
      ),
    );
  }
}

