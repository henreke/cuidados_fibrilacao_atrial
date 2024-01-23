import 'package:flutter/material.dart';
class TabelaSheet extends StatelessWidget {
  const TabelaSheet({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: MediaQuery.of(context).size.height-100,
      color: Color.fromARGB(0, 255, 255, 255),
      child: Padding(
        padding: const EdgeInsets.only(left: 16,right: 16),
        child: ListView(

          children:  [
            Card(
              color: Theme.of(context).colorScheme.primary,
              margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text('Medicamentos que podem causar interação medicamentosa com medicações anticoagulantes',style: TextStyle(fontSize: 24,color: Colors.white)),
              ),
            ),

            InteractiveViewer(
              minScale: 0.1,
              child: Padding(
                padding: EdgeInsets.only(left: 4,right: 4,top: 10),
                child: MediaQuery.of(context).size.width < 800 ? tabela() : tabelaGrande(),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget tabela(){

    return Scrollbar(
      scrollbarOrientation: ScrollbarOrientation.top,
      thumbVisibility: true,

      thickness: 10,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.only(top: 14),
          child: Table(

            border: TableBorder.all(),
            columnWidths: const <int, TableColumnWidth>{
              0:FixedColumnWidth(130),
              1:FixedColumnWidth(130),
              2:FixedColumnWidth(130),
              3:FixedColumnWidth(130),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: const <TableRow>[
              TableRow(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                  children: [
                    Text(' Medicamentos  ',style: TextStyle(fontSize: 16),),
                    Text(' Classe',style: TextStyle(fontSize: 16),),
                    Text(' Indicação',style: TextStyle(fontSize: 16),),
                    Text(' Efeito',style: TextStyle(fontSize: 16),),
                  ]
              ),

              TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                      child: Text('Ibuprofeno e Naproxeno',style: TextStyle(fontSize: 16),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                      child: Text('Anti-inflamatórios não esteroides (AINEs):',style: TextStyle(fontSize: 16),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                      child: Text('Servem para reduzir a inflamação, aliviar a dor e diminuir a febre.',style: TextStyle(fontSize: 16),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                      child: Text('Pode aumentar o risco de sangramento',style: TextStyle(fontSize: 16),),
                    ),
                  ]
              ),
              TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                      child: Text('Aspirina, Clopidogrel',style: TextStyle(fontSize: 16),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                      child: Text('Antiagregante Plaquetário',style: TextStyle(fontSize: 16),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                      child: Text('Ajudam a prevenir a formação de coágulos sanguíneos.',style: TextStyle(fontSize: 16),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                      child: Text('Pode aumentar o risco de sangramento.',style: TextStyle(fontSize: 16),),
                    ),
                  ]
              ),
              TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                      child: Text('Cefalosporinas',style: TextStyle(fontSize: 16),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                      child: Text('Antibióticos',style: TextStyle(fontSize: 16),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                      child: Text('Servem para o tratamento de infeções bacterianas.',style: TextStyle(fontSize: 16),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                      child: Text('Pode aumentar o risco de sangramento.',style: TextStyle(fontSize: 16),),
                    ),
                  ]
              ),
              TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                      child: Text('Fluconazol e outros Antifúngicos',style: TextStyle(fontSize: 16),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                      child: Text('Antifúngico',style: TextStyle(fontSize: 16),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                      child: Text('Servem para tratar infecções fúngicas.',style: TextStyle(fontSize: 16),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                      child: Text('Pode aumentar o risco de sangramento.',style: TextStyle(fontSize: 16),),
                    ),
                  ]
              ),
              TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                      child: Text('Amiodarona',style: TextStyle(fontSize: 16),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                      child: Text('Antiarrítmico',style: TextStyle(fontSize: 16),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                      child: Text('Serve para tratar irregularidades no ritmo cardíaco.',style: TextStyle(fontSize: 16),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                      child: Text('Pode aumentar o risco de sangramento.',style: TextStyle(fontSize: 16),),
                    ),
                  ]
              ),
              TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                      child: Text('Fluoxetina e Sertralina',style: TextStyle(fontSize: 16),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                      child: Text('Antidepressivo',style: TextStyle(fontSize: 16),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                      child: Text('Servem para tratar transtornos depressivos e de ansiedade',style: TextStyle(fontSize: 16),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                      child: Text('Pode aumentar o risco de sangramento.',style: TextStyle(fontSize: 16),),
                    ),
                  ]
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget tabelaGrande(){

    return Padding(
      padding: const EdgeInsets.only(top: 14),
      child: Table(

        border: TableBorder.all(),
        columnWidths: const <int, TableColumnWidth>{
          0:FlexColumnWidth(),
          1:FlexColumnWidth(),
          2:FlexColumnWidth(),
          3:FlexColumnWidth(),
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: const <TableRow>[
          TableRow(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              children: [
                Text(' Medicamentos  ',style: TextStyle(fontSize: 16),),
                Text(' Classe',style: TextStyle(fontSize: 16),),
                Text(' Indicação',style: TextStyle(fontSize: 16),),
                Text(' Efeito',style: TextStyle(fontSize: 16),),
              ]
          ),

          TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                  child: Text('Ibuprofeno e Naproxeno',style: TextStyle(fontSize: 16),),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                  child: Text('Anti-inflamatórios não esteroides (AINEs):',style: TextStyle(fontSize: 16),),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                  child: Text('Servem para reduzir a inflamação, aliviar a dor e diminuir a febre.',style: TextStyle(fontSize: 16),),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                  child: Text('Pode aumentar o risco de sangramento',style: TextStyle(fontSize: 16),),
                ),
              ]
          ),
          TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                  child: Text('Aspirina, Clopidogrel',style: TextStyle(fontSize: 16),),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                  child: Text('Antiagregante Plaquetário',style: TextStyle(fontSize: 16),),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                  child: Text('Ajudam a prevenir a formação de coágulos sanguíneos.',style: TextStyle(fontSize: 16),),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                  child: Text('Pode aumentar o risco de sangramento.',style: TextStyle(fontSize: 16),),
                ),
              ]
          ),
          TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                  child: Text('Cefalosporinas',style: TextStyle(fontSize: 16),),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                  child: Text('Antibióticos',style: TextStyle(fontSize: 16),),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                  child: Text('Servem para o tratamento de infeções bacterianas.',style: TextStyle(fontSize: 16),),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                  child: Text('Pode aumentar o risco de sangramento.',style: TextStyle(fontSize: 16),),
                ),
              ]
          ),
          TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                  child: Text('Fluconazol e outros Antifúngicos',style: TextStyle(fontSize: 16),),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                  child: Text('Antifúngico',style: TextStyle(fontSize: 16),),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                  child: Text('Servem para tratar infecções fúngicas.',style: TextStyle(fontSize: 16),),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                  child: Text('Pode aumentar o risco de sangramento.',style: TextStyle(fontSize: 16),),
                ),
              ]
          ),
          TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                  child: Text('Amiodarona',style: TextStyle(fontSize: 16),),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                  child: Text('Antiarrítmico',style: TextStyle(fontSize: 16),),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                  child: Text('Serve para tratar irregularidades no ritmo cardíaco.',style: TextStyle(fontSize: 16),),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                  child: Text('Pode aumentar o risco de sangramento.',style: TextStyle(fontSize: 16),),
                ),
              ]
          ),
          TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                  child: Text('Fluoxetina e Sertralina',style: TextStyle(fontSize: 16),),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                  child: Text('Antidepressivo',style: TextStyle(fontSize: 16),),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                  child: Text('Servem para tratar transtornos depressivos e de ansiedade',style: TextStyle(fontSize: 16),),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8,right: 8,top: 4),
                  child: Text('Pode aumentar o risco de sangramento.',style: TextStyle(fontSize: 16),),
                ),
              ]
          ),
        ],
      ),
    );
  }
}
