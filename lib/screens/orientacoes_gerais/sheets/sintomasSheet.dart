import 'package:flutter/material.dart';
class sintomasSheet extends StatelessWidget {

  const sintomasSheet({Key? key}) : super(key: key);

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
                  padding: const EdgeInsets.only(left: 8,right: 8,top: 8,bottom: 8),
                  child: Text('Você conhece os sintomas mais comuns da Fibrilação Atrial?',style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.center,),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 10),
              child: Text('Fadiga geral no corpo',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0,right: 25.0,top: 8),
              child: Text('Quando uma pessoa sente uma “fraqueza” com sensação de que o corpo precisa descansar. ',
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 10),
              child: Text('Batimentos cardíacos rápidos e irregulares',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),textAlign: TextAlign.center,),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0,right: 25.0,top: 8),
              child: Text('O coração começa a bater mais rápido que o normal e de forma desordenada.',
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 10),
              child: Text('Vibração ou “batendo” no peito',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0,right: 25.0,top: 8),
              child: Text('O coração está batendo tão acelerado que trará a sensação de que está vibrando.',
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 10),
              child: Text('Tontura',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0,right: 25.0,top: 8),
              child: Text('Cria a falsa sensação de que você ou seus arredores estão girando ou em movimento ',
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 10),
              child: Text('Falta de ar',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0,right: 25.0,top: 8),
              child: Text('É caracterizada pelo desconforto ou dificuldade para respirar.',
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 10),
              child: Text('Ansiedade',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0,right: 25.0,top: 8),
              child: Text('É a sensação de apreensão, angústia, incerteza ou desconforto diante de algo desconhecido',
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 10),
              child: Text('Fraqueza',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 10),
              child: Text('Desmaio ou confusão',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 10),
              child: Text('Fadiga ao fazer exercício',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 10),
              child: Text('Dor ou pressão no peito',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0,right: 25.0,top: 8),
              child: Text('Se você sentir Dor ou pressão no peito chame procure uma unidade de saúde. Você pode estar tendo um ataque cardíaco. Ligue para o 192 imediatamente.',
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
