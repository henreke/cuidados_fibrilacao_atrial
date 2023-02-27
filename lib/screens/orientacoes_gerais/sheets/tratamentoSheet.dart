import 'package:flutter/material.dart';
class tratamentoSheet extends StatelessWidget {

  const tratamentoSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height-100,
      color: Color.fromARGB(0, 255, 255, 255),
      child: SingleChildScrollView(
        child: Column(
          children:  [
            Padding(
              padding: const EdgeInsets.only(left: 16,right: 16,top: 8),
              child: Card(
                color: Theme.of(context).colorScheme.primary,
                margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('Você conhece o tratamento da Fibrilação Atrial?',style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.center,),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(25.0),
              child: Text('O tratamento pode ser realizado através de medicação '
                  'para ajudar a diminuir sua frequência cardíaca que são '
                  'chamados de betabloqueadores; medicmentos para restaurar o '
                  'ritmo cardíaco normal, como betabloqueadores ou '
                  'antiarrítmicos e procedimentos para parar ou controlar os '
                  'impulsos elétricos que causam a FA como cardioversão '
                  'elétrica ou ablação por cateter,medicamentos anticoagulantes '
                  'ou antiplaquetários para prevenir coágulos de sangue e '
                  'por fim o Marca-passo. ',
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
