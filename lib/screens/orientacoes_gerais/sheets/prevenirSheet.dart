import 'package:flutter/material.dart';
class prevenirSheet extends StatelessWidget {

  const prevenirSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height-100,
      color: Color.fromARGB(0, 255, 255, 255),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Padding(
              padding: const EdgeInsets.only(left: 16,right: 16,top: 8),
              child: Card(
                color: Theme.of(context).colorScheme.primary,
                margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('Como prevenir e reduzir riscos de Fibrilação Atrial?',style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.center,),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 10),
              child: Text('Fazer um controle da frequência cardíaca',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 10),
              child: Text('Realizar controle rigoroso da pressão arterial',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 10),
              child: Text('Controle do açúcar no sangue para não desenvolver o diabetes',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 10),
              child: Text('Apneia do sono',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 10),
              child: Text('Sedentarismo',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 10),
              child: Text('Obesidade',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),textAlign: TextAlign.start,),
            ),
          ],
        ),
      ),
    );
  }
}
