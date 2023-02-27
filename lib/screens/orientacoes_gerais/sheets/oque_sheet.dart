import 'package:flutter/material.dart';
class OqueeSheet extends StatelessWidget {

  const OqueeSheet({Key? key}) : super(key: key);

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
                child: Text('Você Sabe o que é fibrilação atrial?',style: TextStyle(fontSize: 20,color: Colors.white)),
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(25.0),
              child: Text('É comum em todo o mundo e atualmente tornou-se um problema de '
                  'saúde pública. É conhecida como um batimento cardíaco trêmulo ou '
                  'irregular (arritmia) que pode desenvolver coágulos sanguíneos, '
                  'derrame, insuficiência cardíaca e outras complicações '
                  'relacionadas ao coração. ',
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
