import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/utils.dart';
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
                child: Text('Você sabe o que é Fibrilação Atrial?',style: TextStyle(fontSize: 24,color: Colors.white)),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('É uma arritmia que causa completa desorganização do ritmo elétrico do átrio. Ocorre quando os átrios (as câmaras superiores do coração) batem de forma irregular e descoordenada, em vez de baterem em um ritmo regular. Esse padrão irregular pode levar a um aumento na frequência cardíaca e afetar a capacidade eficaz do coração de bombear o sangue para o resto do corpo (Cintra; Figueiredo, 2021 e Melo et al., 2022).'
                    '\nMundialmente, é a arritmia de maior frequência, afetando cerca de 3% da população adulta, com idade acima de 55 anos, acometendo mais o sexo masculino. No Brasil, estima-se que de 1-4% da população é acometida por esta doença (Melo et al., 2022).',
                    style: TextStyle(fontSize: Utils.font_textos,fontWeight: FontWeight.w500),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 8,),
                  Text('Para maiores informações, acessar',style: TextStyle(fontSize: Utils.font_textos,fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,),
                  InkWell(
                    child: Text('Diretrizes Brasileiras de Fibrilação Atrial',style: TextStyle(fontSize: Utils.font_textos,color: Colors.blueAccent),),
                    onTap: ()=>launchUrl(Uri.parse("http://publicacoes.cardiol.br/2014/diretrizes/2016/02_II%20DIRETRIZ_FIBRILACAO_ATRIAL.pdf")),
                  ),

                  SizedBox(height: 8,),
                  InkWell(
                    child: Text('Artigo sobre Fibrilação Atrial: Fisiopatologia, Fatores de Risco e Bases Terapêuticas',style: TextStyle(fontSize: Utils.font_textos,color: Colors.blueAccent),),
                    onTap: ()=>launchUrl(Uri.parse("https://www.scielo.br/j/abc/a/48ngThJGMbXS67MGvJ3tJCn/")),
                  ),
                  SizedBox(height: 8,),
                  InkWell(
                    child: Text('Artigo sobre manejo clínico da fibrilação atrial: uma revisão integrativa das evidências atuais',style: TextStyle(fontSize: Utils.font_textos,color: Colors.blueAccent),),
                    onTap: ()=>launchUrl(Uri.parse("https://bio10publicacao.com.br/jesh/article/view/102")),
                  ),
                  SizedBox(height: 8,),
                  InkWell(
                    child: Text('Vídeo sobre a doença Fibrilação Atrial',style: TextStyle(fontSize: Utils.font_textos,color: Colors.blueAccent),),
                    onTap: ()=>launchUrl(Uri.parse("https://www.youtube.com/watch?v=NNkkzWcseA0")),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
