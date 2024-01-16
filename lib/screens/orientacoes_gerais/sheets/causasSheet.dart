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
                child: Text('Principais causas',style: TextStyle(fontSize: 24,color: Colors.white)),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(25.0),
              child: Text('${String.fromCharCodes([0x2714])} Hipertensão arterial sistêmica: também conhecida como pressão alta. Ocorre por uma pressão sanguínea elevada persistentemente nas artérias. É a força que o sangue exerce contra as paredes das artérias à medida que é bombeado pelo coração e circula pelo corpo. ',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Text('${String.fromCharCodes([0x2714])} Doença cardíaca estrutural: refere-se a condições em que há alterações ou anormalidades na estrutura do coração. Doença coronariana, insuficiência cardíaca, defeitos cardíacos congênitos ou válvulas cardíacas anormais são problemas que podem aumentar o risco de fibrilação atrial.',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Text('${String.fromCharCodes([0x2714])} Doença cardíaca isquêmica: É a condição que provoca a diminuição do fluxo sanguíneo para o músculo cardíaco.',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Text('${String.fromCharCodes([0x2714])} Doença arterial coronariana: é uma condição em que as artérias que fornecem sangue ao coração ficam estreitas ou bloqueadas, afetando o fluxo sanguíneo para o músculo cardíaco.',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Text('${String.fromCharCodes([0x2714])} Diabetes:  é uma condição crônica que afeta a forma como o corpo lida com o açúcar no sangue. A fibrilação atrial pode acontecer especialmente se o diabetes não estiver bem controlado.',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Text('${String.fromCharCodes([0x2714])} Doença pulmonar crônica: um termo geral usado para descrever um grupo de doenças pulmonares progressivas que causam obstrução do fluxo de ar nos pulmões.',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Text('${String.fromCharCodes([0x2714])} Doença renal crônica: é uma condição em que os rins não funcionam adequadamente por um período prolongado.',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),

            Padding(
              padding: EdgeInsets.all(25.0),
              child: Text('${String.fromCharCodes([0x2714])} Consumo excessivo de bebidas alcoólicas.',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Text('${String.fromCharCodes([0x2714])} Tabagismo: ato de fumar tabaco, seja por meio de cigarros, charutos, cachimbos ou outros produtos de tabaco.',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Text('${String.fromCharCodes([0x2714])} Sedentarismo: é um estilo de vida caracterizado por uma falta de atividade física regular ou por longos períodos sem nenhuma atividade física.',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Text('${String.fromCharCodes([0x2714])} Fatores genéticos: O Histórico familiar pode contribuir para a fibrilação atrial. ',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Text('${String.fromCharCodes([0x2714])} Hipertireoidismo: é uma doença em que a glândula tireóide, localizada na parte anterior do pescoço, produz excesso de hormônios tireoidianos.',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Text('${String.fromCharCodes([0x2714])} Obesidade: é uma condição caracterizada pelo acúmulo excessivo de gordura corporal, resultando em um peso acima do considerado saudável para uma determinada altura.',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Text('${String.fromCharCodes([0x2714])} Apneia Obstrutiva do Sono: é um distúrbio caracterizado por pausas temporárias na respiração durante o sono.',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(25.0),
              child: Text('(Santos et al.,2023)',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
