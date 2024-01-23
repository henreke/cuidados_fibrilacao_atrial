import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class oQueAconteceSheet extends StatelessWidget {
  const oQueAconteceSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 100,
      color: Color.fromARGB(0, 255, 255, 255),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
              child: Card(
                color: Theme.of(context).colorScheme.primary,
                margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                child:  Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                      'Sabe o que acontece durante a Fibrilação Atrial?',
                      style: TextStyle(fontSize: Utils.font_textos, color: Colors.white),
                      textAlign: TextAlign.center),
                ),
              ),
            ),
             Padding(
              padding: EdgeInsets.all(25.0),
              child: Text(
                'Durante a fibrilação atrial, ocorre uma anormalidade no ritmo cardíaco, afetando as câmaras superiores do coração, chamadas de átrios. Em vez de contrações cardíacas regulares e coordenadas, os átrios entram em um estado de atividade elétrica caótica e desorganizada. Os impulsos elétricos que normalmente coordenam as contrações dos átrios tornam-se desorganizados, ou seja, o coração “fibrila” (treme) (Veloso et al; 2022).',
                style: TextStyle(fontSize: Utils.font_textos, fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),

            ),

            Padding(
              padding: EdgeInsets.all(25.0),
              child: Text(
                'Como resultado da atividade elétrica desordenada, o coração pode levar a uma perda significativa da eficiência da sua função cardíaca. Este impulso pode ser transmitido aos ventrículos, as câmaras inferiores do coração, e isso pode resultar em uma frequência cardíaca rápida e irregular (Heinisch; Leal; Heinric, 2023).',
                style: TextStyle(fontSize: Utils.font_textos, fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
