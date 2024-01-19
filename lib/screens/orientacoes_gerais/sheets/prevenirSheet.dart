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
                  child: Text('Como prevenir e reduzir riscos de Fibrilação Atrial',style: TextStyle(fontSize: 24,color: Colors.white),textAlign: TextAlign.center,),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 10),
              child: Text('${String.fromCharCodes([0x2714])}Fazer controle da frequência cardíaca: O controle da frequência em casa deve ser feito com a orientação e aprovação de um profissional de saúde. Caso tenha disponível, utilize um monitor de frequência cardíaca; verifique a frequência cardíaca regularmente, em momentos específicos do dia ou quando surgirem sintomas e registre os resultados, pois isso pode ajudar o profissional de saúde a avaliar a eficácia do tratamento;',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(25.0),
              child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(text:'${String.fromCharCodes([0x2714])}Realizar controle rigoroso (Manhã e Noite) da pressão arterial: O ideal é manter uma pressão sistólica de 120 – 129  e a diastólica deve ser mantida abaixo de 80 mmHg.',
                      style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),

                    ),
                    TextSpan(text:'\nAtenção:',style: TextStyle(fontSize: 26,fontWeight: FontWeight.w800)),
                    TextSpan(text:' Este valor pode variar de acordo com a sua condição clínica!',
                      style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),

                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 10),
              child: Text('${String.fromCharCodes([0x2714])}Realizar controle rigoroso (Manhã e Noite) da pressão arterial: O ideal é manter uma pressão sistólica de 120 – 129  e a diastólica deve ser mantida abaixo de 80 mmHg.\nAtenção: Este valor pode variar de acordo com a sua condição clínica!',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 10),
              child: Text('${String.fromCharCodes([0x2714])}Consumir uma dieta balanceada e equilibrada: Evite alimentos ricos em sódio (sal), O sódio pode contribuir para a retenção de líquidos e elevar a pressão arterial. Evite alimentos processados, fast food e alimentos muito salgados;',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 10),
              child: Text('${String.fromCharCodes([0x2714])}Alimentos ricos em gordura saturada: Reduza o consumo de alimentos ricos em gordura saturada, como carnes gordurosas, produtos de panificação, frituras e alimentos processados;',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 10),
              child: Text('${String.fromCharCodes([0x2714])}Cafeína: Modere o consumo de café, chá e outras fontes de cafeína. Utilizar 200 a 300 miligramas de cafeína por dia, o que é aproximadamente o equivalente a uma ou duas xícaras de café;',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 10),
              child: Text('${String.fromCharCodes([0x2714])}Álcool: O consumo excessivo de álcool pode aumentar o risco de fibrilação atrial. Discutir com seu médico durante a avaliação para uma orientação individualizada com base na sua saúde global;',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 10),
              child: Text('${String.fromCharCodes([0x2714])}Açúcar refinado: Reduza a ingestão de açúcares adicionados, presentes em doces, refrigerantes. Isso também pode ajudar a manter um peso saudável;',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 10),
              child: Text('${String.fromCharCodes([0x2714])}Alimentos ricos em vitamina K: Se a pessoa estiver tomando anticoagulantes, ela pode precisar monitorar a ingestão de alimentos ricos em vitamina K, como couve, espinafre e brócolis, coentro, alface, pois esses alimentos podem interferir com a ação dos medicamentos;',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 10),
              child: Text('${String.fromCharCodes([0x2714])}Bebidas energéticas: Evite bebidas energéticas como Red Bull, Monster Energy, entre outros, pois apresentam a cafeína e outros ingredientes que podem afetar o ritmo cardíaco;',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 10),
              child: Text('${String.fromCharCodes([0x2714])}Controle da apneia do sono: Este controle pode ser feito através da perda de peso, quando a apneia estiver relacionada à obesidade; assim como evitar o consumo de bebidas alcoólicas e o uso de sedativos, pois essas substâncias podem relaxar os músculos da garganta, contribuindo para a obstrução das vias respiratórias; posicionar-se adequadamente durante o sono, como dormir de lado, em vez de costas, pois reduz a gravidade da apneia do sono em alguns casos;  em alguns casos, dispositivos ou estratégias podem ser usados para evitar que a pessoa durma de costas; além disso, é importante avaliar a necessidade do uso de CPAP, ou seja, de um aparelho que ajuda a melhorar o sono;',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 10),
              child: Text('${String.fromCharCodes([0x2714])}Atividade Física: Realizar atividade aeróbica regular de moderada intensidade no mínimo de 150 minutos/semanais, que podem variar entre três vezes por semana de 50 minutos ou cinco vezes por semana de 30 minutos.',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 10),
              child: Text('${String.fromCharCodes([0x2714])}Fazer controle de peso alimentando-se adequadamente;',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),

            Padding(
              padding: EdgeInsets.all(25.0),
              child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(text:'${String.fromCharCodes([0x2714])}Atenção:',style: TextStyle(fontSize: 26,fontWeight: FontWeight.w800)),
                    TextSpan(text:' Sempre informe à equipe de saúde sobre todos os medicamentos, suplementos que você está tomando antes de iniciar ou modificar o tratamento com anticoagulantes.',
                      style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),

                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30,)

          ],
        ),
      ),
    );
  }

  Widget tabela(){
    return Table(
      border: TableBorder.all(),
      columnWidths: const <int, TableColumnWidth>{
        0: FlexColumnWidth(1.2),
        1: FlexColumnWidth(),
        2:FlexColumnWidth(),
        4:FlexColumnWidth()
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: const <TableRow>[
        TableRow(
          decoration: BoxDecoration(
            color: Colors.grey,
          ),
          children: [
            Text(' Medicamentos  '),
            Text(' Classe'),
            Text(' Indicação'),
            Text(' Efeito'),
          ]
        ),

        TableRow(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                child: Text('Ibuprofeno e Naproxeno'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                child: Text('Anti-inflamatórios não esteroides (AINEs):'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                child: Text('Servem para reduzir a inflamação, aliviar a dor e diminuir a febre.'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                child: Text('Pode aumentar o risco de sangramento'),
              ),
            ]
        ),
        TableRow(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                child: Text('Aspirina, Clopidogrel'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                child: Text('Antiagregante Plaquetário'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                child: Text('Ajudam a prevenir a formação de coágulos sanguíneos.'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                child: Text('Pode aumentar o risco de sangramento.'),
              ),
            ]
        ),
        TableRow(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                child: Text('Cefalosporinas'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                child: Text('Antibióticos'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                child: Text('Servem para o tratamento de infeções bacterianas. '),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                child: Text('Pode aumentar o risco de sangramento.'),
              ),
            ]
        ),
        TableRow(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                child: Text('Fluconazol e outros Antifúngicos'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                child: Text('Antifúngico'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                child: Text('Servem para tratar infecções fúngicas.'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                child: Text('Pode aumentar o risco de sangramento.'),
              ),
            ]
        ),
        TableRow(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                child: Text('Amiodarona'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                child: Text('Antiarrítmico'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                child: Text('Serve para tratar irregularidades no ritmo cardíaco.'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                child: Text('Pode aumentar o risco de sangramento.'),
              ),
            ]
        ),
        TableRow(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                child: Text('Fluoxetina e Sertralina'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                child: Text('Antidepressivo'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                child: Text('Servem para tratar transtornos depressivos e de ansiedade'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                child: Text('Pode aumentar o risco de sangramento.'),
              ),
            ]
        ),
      ],
    );
  }
}
