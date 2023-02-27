import 'package:flutter/material.dart';
class oQueAconteceSheet extends StatelessWidget {

  const oQueAconteceSheet({Key? key}) : super(key: key);

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
                  child: Text('Sabe o que acontece durante a fibrilação atrial?',style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.center),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(25.0),
              child: Text('O nosso coração faz contração e relaxamento de suas '
                  'câmaras chamadas átrios e ventrículos em um ritmo regular. '
                  'Quando acontece a FA, as suas câmaras superiores chamadas de '
                  'átrios começam a bater de forma irregular, ou seja, tremem em '
                  'vez de bater efetivamente para mover o sangue para os '
                  'ventrículos. Com isso, corre-se o risco de se um coágulo '
                  'de sangue soltar-se e ficar em uma artéria podendo levar'
                  ' ao cérebro e ocasionar um derrame.',
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
