import 'package:cuidados_fibrilacao_atrial/utils/string_extension.dart';
import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class tratamentoSheet extends StatelessWidget {

  const tratamentoSheet({Key? key}) : super(key: key);

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
                  child: Text('Você conhece o tratamento da Fibrilação Atrial?',style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.center,),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(25.0),
              child: Text('O tratamento da fibrilação atrial pode variar de acordo com a gravidade dos sintomas:',
                style: TextStyle(fontSize: Utils.font_textos,fontWeight: FontWeight.w800),
                textAlign: TextAlign.justify,
              ),
            ),

            Padding(
              padding: EdgeInsets.all(25.0),
              child: Text('${String.fromCharCodes([0x2714])}Controle da Frequência Cardíaca: São utilizados medicamentos como betabloqueadores, bloqueadores dos canais de cálcio ou digoxina que podem ser prescritos pelo médico e ajudará no controle da frequência, na manutenção dos batimentos cardíacos em uma faixa normal e na diminuição dos sintomas;',
                style: TextStyle(fontSize: Utils.font_textos,fontWeight: FontWeight.w500,letterSpacing: 0),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Text('${String.fromCharCodes([0x2714])}Controle do Ritmo Cardíaco: Medicamentos antiarrítmicos podem ser usados para restaurar e manter o ritmo do coração normal. No entanto, esses medicamentos podem ter efeitos colaterais e seu uso deve ser cuidadosamente monitorado;',
                style: TextStyle(fontSize: Utils.font_textos,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Text('${String.fromCharCodes([0x2714])}Anticoagulação: Pessoas com a doença da fibrilação atrial têm um risco maior de formação de coágulos sanguíneos, o que pode levar ao Acidente Vascular Cerebral (AVC). Para algumas situações, também são utilizados os antiagregantes plaquetários para auxiliar na redução dos coágulos;',
                style: TextStyle(fontSize: Utils.font_textos,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Text('${String.fromCharCodes([0x2714])}Cardioversão: Caracteriza-se como a aplicação de um “choque elétrico” controlado sobre o coração para restaurar o ritmo do coração normal;',
                style: TextStyle(fontSize: Utils.font_textos,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Text('${String.fromCharCodes([0x2714])}Ablação por Cateter: Em casos mais graves ou persistentes de arritmia, a ablação por cateter pode ser considerada. Este procedimento envolve a destruição de pequenas áreas no coração que podem estar causando a fibrilação atrial;',
                style: TextStyle(fontSize: Utils.font_textos,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Text('${String.fromCharCodes([0x2714])}Implantação de Marca-Passo: Em algumas situações, pode ocorrer a necessidade da utilização do marca-passo, especialmente quando há uma combinação de bradicardia (batimentos cardíacos muito lentos) associada a episódios de fibrilação atrial. Nessas situações, o marca-passo pode ser implantado para garantir que o coração mantenha uma frequência cardíaca mínima adequada, mesmo durante os episódios de fibrilação atrial;',
                style: TextStyle(fontSize: Utils.font_textos,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Text('${String.fromCharCodes([0x2714])}Tratamento Cirúrgico: Em situações mais complexas, o médico pode recomendar uma cirurgia cardíaca para corrigir a fibrilação atrial;',
                style: TextStyle(fontSize: Utils.font_textos,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Text('${String.fromCharCodes([0x2714])}Modificação do Estilo de Vida: Mudanças no estilo de vida como controle do peso, exercícios regulares, redução do consumo de álcool e cessação do tabagismo podem ajudar a controlar a doença;',
                style: TextStyle(fontSize: Utils.font_textos,fontWeight: FontWeight.w500),
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
                    TextSpan(text:'${String.fromCharCodes([0x2714])}Atenção:',style: TextStyle(fontSize: Utils.font_textos,fontWeight: FontWeight.w800,color: Colors.red)),
                    TextSpan(text:' É importante destacar que o tratamento é individualizado e depende das características específicas de cada paciente. O acompanhamento médico regular é muito importante para ajustar o plano de tratamento conforme necessário e monitorar a eficácia e a segurança das intervenções.',
                      style: TextStyle(fontSize: Utils.font_textos,fontWeight: FontWeight.w500),

                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(25.0),
                child: Text('(Craig, 2019; Hendricks, 2020; Santos, 2023) ',
                  style: TextStyle(fontSize: Utils.font_textos,fontWeight: FontWeight.w500),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
