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
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 16,right: 16,top: 8),
                child: Card(
                  color: Theme.of(context).colorScheme.primary,
                  margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: const Padding(
                    padding: const EdgeInsets.only(left: 8,right: 8,top: 8,bottom: 8),
                    child: Text('Você conhece os sintomas mais comuns da Fibrilação Atrial?',style: TextStyle(fontSize: 24,color: Colors.white),textAlign: TextAlign.center,),
                  ),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 10),
              child: Text('Palpitação no coração',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w800),),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0,right: 25.0,top: 8),
              child: Text('Referem à sensação percebida de batimentos cardíacos anormais ou irregulares.',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 10),
              child: Text('Falta de Ar ao esforço',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w800),textAlign: TextAlign.center,),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0,right: 25.0,top: 8),
              child: Text('Refere-se à dificuldade em respirar durante a prática de exercícios, subida de escadas, ou outras atividades que exigem esforço físico.',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 10),
              child: Text('Fraqueza e/ou Fadiga',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w800),),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0,right: 25.0,top: 8),
              child: Text('É a sensação de cansaço e falta de energia.',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 10),
              child: Text('Tontura',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w800),),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0,right: 25.0,top: 8),
              child: Text('Sensação de desequilíbrio do corpo.',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 10),
              child: Text('Desmaio',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w800),),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0,right: 25.0,top: 8),
              child: Text('Uma perda temporária de consciência que geralmente ocorre devido à diminuição temporária do fluxo sanguíneo para o cérebro.',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 10),
              child: Text('Ansiedade',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w800),),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0,right: 25.0,top: 8),
              child: Text('É uma resposta natural do corpo a situações de estresse, perigo ou incerteza',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 10),
              child: Text('Dor no no peito',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w800),),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 10),
              child: Text('Apneia do Sono',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w800),),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 10),
              child: Text('Estresse',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w800),),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 10),
              child: Text('Hábitos de vida inadequados',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w800),),
            ),
            const SizedBox(height: 8,),
            const Padding(
              padding: EdgeInsets.only(left: 25.0,right: 25.0,top: 8),
              child: Text('Pode-se também encontrar sintomas como pressão arterial muito baixa, problemas pulmonares decorrentes da falha do funcionamento do coração, entre outros.',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),

            const SizedBox(height: 8,),
            Center(
              child: const Padding(
                padding: EdgeInsets.only(left: 25.0,right: 25.0,top: 8),
                child: Text('(Hindricks, 2020; Santos, 2023)',
                  style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
