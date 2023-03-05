import 'package:cuidados_fibrilacao_atrial/data/perguntas.dart';

class Avaliacao{
  List<Perguntas> perguntas = [];
  String idPaciente = '';
  int data = 0;
  List<int> respostas = [];
  Avaliacao({required this.perguntas, required this.idPaciente,this.data = 0});

  static List<Perguntas> perguntas_const = [
    Perguntas(
        titulo: "1. Você sente que seu coração tem batimentos cardíacos acelerados?",
        respostas: ["Nunca","Raramente","Frequentemente","Sempre"]
    ),
    Perguntas(
        titulo: "2. Você faz atividade física?",
        respostas: ["Sim","Não"]
    ),
    Perguntas(
        titulo: "3. Seu coração apresenta um ritmo cardíaco diferente?",
        respostas: ["Nunca","Raramente","Frequentemente","Sempre"]
    ),
    Perguntas(
        titulo: "4. Você se sente ansioso quando seu coração fica acelerado?",
        respostas: ["Nunca","Raramente","Frequentemente","Sempre"]
    ),
    Perguntas(
        titulo: "5. Você fica com falta de ar em suas atividades normais?",
        respostas: ["Nunca","Raramente","Frequentemente","Sempre"]
    ),
    Perguntas(
        titulo: "6. Você sente falta de ar ao deitar?",
        respostas: ["Nunca","Raramente","Frequentemente","Sempre"]
    ),
    Perguntas(
        titulo: "7. Você se cansa mais facilmente que anteriormente?",
        respostas: ["Nunca","Raramente","Frequentemente","Sempre"]
    ),
    Perguntas(
        titulo: "8. Você fica tonto?",
        respostas: ["Nunca","Raramente","Frequentemente","Sempre"]
    ),
    Perguntas(
        titulo: "9. Você fica preocupado que em algum momento você pode desmaiar?",
        respostas: ["Nunca","Raramente","Frequentemente","Sempre"]
    ),
    Perguntas(
        titulo: "10. Você fica tonto ao levantar-se?",
        respostas: ["Nunca","Raramente","Frequentemente","Sempre"]
    ),
  ];
  toJson() => {
    'idPaciente':this.idPaciente,
    'perg1': this.perguntas[0].marcada,
    'perg2':this.perguntas[1].marcada,
    'perg3':this.perguntas[2].marcada,
    'perg4':this.perguntas[3].marcada,
    'perg5':this.perguntas[4].marcada,
    'perg6':this.perguntas[5].marcada,
    'perg7':this.perguntas[6].marcada,
    'perg8':this.perguntas[7].marcada,
    'perg9':this.perguntas[8].marcada,
    'perg10':this.perguntas[9].marcada,
  };

}