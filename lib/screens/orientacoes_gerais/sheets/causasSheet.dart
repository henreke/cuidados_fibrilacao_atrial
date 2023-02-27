import 'package:flutter/material.dart';
class causasSheet extends StatelessWidget {

  const causasSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height-100,
      color: Color.fromARGB(0, 255, 255, 255),
      child: SingleChildScrollView(
        child: Column(
          children:  [
            Card(
              color: Theme.of(context).colorScheme.primary,
              margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text('Principais causas',style: TextStyle(fontSize: 20,color: Colors.white)),
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(25.0),
              child: Text('A fibrilação atrial pode não ter causa aparente, '
                  'mas muitas vezes se desenvolve em corações que já tem uma'
                  ' doença cardíaca como a insuficiência cardíaca '
                  '(coração fraco), infarto e problemas nas válvulas. '
                  'Alterações na tireoide e uso excessivo de bebidas '
                  'alcoólicas também podem promover a FA.',
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
