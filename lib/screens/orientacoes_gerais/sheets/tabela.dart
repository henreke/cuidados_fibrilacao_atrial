import 'package:flutter/material.dart';
class TabelaSheet extends StatelessWidget {
  const TabelaSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height-100,
      color: Color.fromARGB(0, 255, 255, 255),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16,right: 16),
          child: Column(

            children:  [
              Card(
                color: Theme.of(context).colorScheme.primary,
                margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('Medicamentos que podem causar interação medicamentosa com medicações anticoagulantes',style: TextStyle(fontSize: 24,color: Colors.white)),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 4,right: 4,top: 10),
                child: tabela(),
              ),
            ],
          ),
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
