import 'package:cuidados_fibrilacao_atrial/utils/utils.dart';
import 'package:flutter/material.dart';

class MedicamentosTile extends StatefulWidget {

  late String? nome;
  late String? nome_medico;
  late int? data;
  late int? dose;
  late int? frequencia;
  late int? dose_tomadas;
  late int? dose_prescrita;
  late void Function() tomarMedicacao;
  MedicamentosTile({Key? key,this.nome, this.data, this.dose, this.frequencia,this.dose_tomadas,required this.tomarMedicacao,required this.nome_medico,required this.dose_prescrita}) : super(key: key);



  @override
  State<MedicamentosTile> createState() => _MedicamentosTileState();
}

class _MedicamentosTileState extends State<MedicamentosTile> {
  @override
  Widget build(BuildContext context) {
    bool faltaTomar = (widget.frequencia! - widget.dose_tomadas!) > 0;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width-160,
                    child: Text('Medicamento:\n${widget.nome}')
                ),

                Text('${widget.frequencia} vezes ao dia.')
              ],
            ),
            const SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Data de início: ${Utils.epochToString(widget.data!)}'),
                Text('Dose: ${widget.dose}mg'),
              ],
            ),
            const SizedBox(height: 8,),
            Text('Prescrito por:\n${widget.nome_medico ?? ''}'),
            const SizedBox(height: 8,),
            Text(faltaTomar ? 'Ainda faltam ${widget.frequencia! - widget.dose_tomadas!} hoje.' : 'Parabéns você já tomou sua medicação completa hoje'),
            if (faltaTomar)TextButton(onPressed: ()=>widget.tomarMedicacao(), child: const Text('Tomei minha medicação')),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 50,
                  child: CustomPaint(
                    painter: comprimidoRetangulo(perc: (widget.dose!/widget.dose_prescrita!),deslocamento_horizontal: 10,deslocamento_vertical: 15),
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: CustomPaint(painter: comprimidoCirculo(perc: (widget.dose!/widget.dose_prescrita!),deslocamento_horizontal: -150,deslocamento_vertical: 0),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }



}

class comprimidoRetangulo extends CustomPainter {

  double? perc;
  double? deslocamento_horizontal;
  double? deslocamento_vertical;

  comprimidoRetangulo({this.perc = 1,this.deslocamento_horizontal = 0,this.deslocamento_vertical = 0});

  @override
  void paint(Canvas canvas, Size size) {

    int inteiros = perc!.truncate();
    double fracao = perc! - perc!.truncate();
    if (perc! >= 1){
      for (int i = 0; i<inteiros; i++){
        desenhar(canvas: canvas,deslocamento_horizontal: (i*70)+this.deslocamento_horizontal!,deslocamento_vertical: this.deslocamento_vertical!);
      }

    }
    if (fracao != 0.0) {
      desenhar(
          canvas: canvas,
          perc: perc! - perc!.truncate(),
          deslocamento_horizontal: (perc!.truncate() * 70)+this.deslocamento_horizontal!,
          deslocamento_vertical: this.deslocamento_vertical!);
    }
  }

  void desenhar({required Canvas canvas,double perc = 1,double deslocamento_horizontal = 0,double deslocamento_vertical = 0}){
    var paint1 = Paint()
      ..color = Colors.greenAccent
      ..style = PaintingStyle.fill;

    var paint2 = Paint()
      ..color = Colors.redAccent
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(10+deslocamento_horizontal,10+deslocamento_vertical), 10, paint1);
    if (perc < 0.99) {
      canvas.drawCircle(Offset(60+deslocamento_horizontal, 10+deslocamento_vertical), 10, paint2);
    } else {
      canvas.drawCircle(Offset(60+deslocamento_horizontal, 10+deslocamento_vertical), 10, paint1);
    }
    canvas.drawRect( Rect.fromLTRB(10+deslocamento_horizontal, 0+deslocamento_vertical, (10+50*perc)+deslocamento_horizontal, 20+deslocamento_vertical), paint1);
    canvas.drawRect( Rect.fromLTRB((10+50*perc)+deslocamento_horizontal, 0+deslocamento_vertical, 60+deslocamento_horizontal, 20+deslocamento_vertical), paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class comprimidoCirculo extends CustomPainter {

  double? perc;
  double? deslocamento_horizontal;
  double? deslocamento_vertical;

  comprimidoCirculo({this.perc = 1,this.deslocamento_horizontal = 0,this.deslocamento_vertical = 0});

  @override
  void paint(Canvas canvas, Size size) {
    int inteiros = perc!.truncate();
    double fracao = perc! - perc!.truncate();
    if (perc! >= 1){
      for (int i = 0; i<inteiros; i++){
        desenhar(canvas: canvas,deslocamento_horizontal: (i*52)+this.deslocamento_horizontal!,deslocamento_vertical: this.deslocamento_vertical!);
      }

    }
    if (fracao != 0.0) {
      desenhar(
          canvas: canvas,
          perc: perc! - perc!.truncate(),
          deslocamento_horizontal: (perc!.truncate() * 52)+this.deslocamento_horizontal!);
    }
  }

  void desenhar({required Canvas canvas,double perc = 1,double deslocamento_horizontal = 0,double deslocamento_vertical = 0}){

    var paint1 = Paint()
      ..color = Colors.greenAccent
      ..style = PaintingStyle.fill;

    var paint2 = Paint()
      ..color = Colors.redAccent
      ..style = PaintingStyle.fill;
    //canvas.drawCircle(Offset(100,10), 10, paint1);

    canvas.drawArc(Rect.fromLTRB(deslocamento_horizontal, 0+deslocamento_vertical, 50+deslocamento_horizontal, 50+deslocamento_vertical), 4.71, -2*3.14*perc, true, paint1);
    canvas.drawArc(Rect.fromLTRB(deslocamento_horizontal, 0+deslocamento_vertical,50+deslocamento_horizontal, 50+deslocamento_vertical), 4.71, 2*3.14*(1-perc), true, paint2);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
