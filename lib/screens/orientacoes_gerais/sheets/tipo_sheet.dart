import 'package:flutter/material.dart';
class TiposSheet extends StatelessWidget {

  const TiposSheet({Key? key}) : super(key: key);

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
              child: Card(
                color: Theme.of(context).colorScheme.primary,
                margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('Quais os tipos de Fibrilação Atrial?',style: TextStyle(fontSize: 20,color: Colors.white)),
                ),
              ),
            ),

            const Padding(
                padding: EdgeInsets.only(left: 25,right: 25,top: 10),
                child: Text('Fibrilação paroxística',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0,right: 25.0,top: 8),
              child: Text('Ocorre quando o coração retorna ao ritmo normal por conta própria ou com intervenção dentro de 7 dias após o início;',
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 10),
              child: Text('Fibrilação persistente ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0,right: 25.0,top: 8),
              child: Text('Ocorre quando o ritmo irregular do coração com duração maior de 7 dias, não retorna ao ritmo normal por conta própria e exigirá algum tipo de tratamento. Neste caso, a interrupção da Fibrilação Atrial exigirá uma cardioversão elétrica e/ou farmacológica, considerados métodos para reversão da arritmia;',
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 10),
              child: Text('Fibrilação de longa duração',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0,right: 25.0,top: 8),
              child: Text('Ocorre quando o coração persiste em um ritmo irregular com duração maior que 12 meses, ou seja, 1 ano;',
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 10),
              child: Text('Fibrilação permanente',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0,right: 25.0,top: 8),
              child: Text('Ocorre quando a condição de arritmia do coração dura indefinidamente e as tentativas de reversão ao ritmo sinusal não serão mais instituídas;',
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 10),
              child: Text('Fibrilação não valvular',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0,right: 25.0,top: 8),
              child: Text('É a fibrilação atrial não causada por um problema na válvula cardíaca;',
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 8,),
            const Padding(
              padding: EdgeInsets.only(left: 25.0,right: 25.0,top: 8),
              child: Text('(Sociedade Brasileira de Cardiologia, 2016)',
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 90,)
          ],
        ),
      ),
    );
  }
}
