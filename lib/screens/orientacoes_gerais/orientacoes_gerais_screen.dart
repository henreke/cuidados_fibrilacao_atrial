import 'package:cuidados_fibrilacao_atrial/screens/orientacoes_gerais/sheets/causasSheet.dart';
import 'package:cuidados_fibrilacao_atrial/screens/orientacoes_gerais/sheets/oque_sheet.dart';
import 'package:cuidados_fibrilacao_atrial/screens/orientacoes_gerais/sheets/oqueacontece_sheet.dart';
import 'package:cuidados_fibrilacao_atrial/screens/orientacoes_gerais/sheets/prevenirSheet.dart';
import 'package:cuidados_fibrilacao_atrial/screens/orientacoes_gerais/sheets/sintomasSheet.dart';
import 'package:cuidados_fibrilacao_atrial/screens/orientacoes_gerais/sheets/tabela.dart';
import 'package:cuidados_fibrilacao_atrial/screens/orientacoes_gerais/sheets/tipo_sheet.dart';
import 'package:cuidados_fibrilacao_atrial/screens/orientacoes_gerais/sheets/tratamentoSheet.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';


class OrientacoesGeraisScreen extends StatefulWidget {
  const OrientacoesGeraisScreen({super.key});

  @override
  State<OrientacoesGeraisScreen> createState() => _OrientacoesGeraisScreenState();
}

class _OrientacoesGeraisScreenState extends State<OrientacoesGeraisScreen> {
  Widget pagina = OqueeSheet();
  @override
  Widget build(BuildContext context) {
    final ButtonStyle styleButton = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20),minimumSize: Size(MediaQuery.of(context).size.width-16,40));
    final ButtonStyle styleButton2 = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20),minimumSize: Size(MediaQuery.of(context).size.width/3,40));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informações gerais sobre a doença fibrilação atrial'),
        centerTitle: true,
      ),
      body: MediaQuery.of(context).size.width > 800 ? orientacoes(context, styleButton2) : SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ElevatedButton(
                onPressed: (){
                  showMaterialModalBottomSheet(
                      context: context,
                      expand: false,
                      elevation: 16,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Theme.of(context).colorScheme.primary,width: 10),
                        borderRadius: BorderRadius.circular(30)
                      ),
                      builder: (context){
                        return const OqueeSheet();
                      }
                  );
                },
                child: const Text('Você sabe o que é Fibrilação Atrial?',style: TextStyle(fontSize: 24,),textAlign: TextAlign.center),
              style: styleButton,
            ),
            const SizedBox(height: 4,),
            ElevatedButton(
              onPressed: (){
                showMaterialModalBottomSheet(
                    context: context,
                    expand: false,
                    elevation: 16,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Theme.of(context).colorScheme.primary,width: 10),
                        borderRadius: BorderRadius.circular(30)
                    ),
                    builder: (context){
                      return const TiposSheet();
                    }
                );
              },
              child: const Text('Quais os tipos de Fibrilação Atrial?',style: TextStyle(fontSize: 24,),textAlign: TextAlign.center),
              style: styleButton,
            ),
            const SizedBox(height: 8,),
            ElevatedButton(
              onPressed: (){
                showMaterialModalBottomSheet(
                    context: context,
                    expand: false,
                    elevation: 16,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Theme.of(context).colorScheme.primary,width: 10),
                        borderRadius: BorderRadius.circular(30)
                    ),
                    builder: (context){
                      return const oQueAconteceSheet();
                    }
                );
              },
              child: const Text('Sabe o que acontece durante a  Fibrilação Atrial?',style: TextStyle(fontSize: 24,),textAlign: TextAlign.center),
              style: styleButton,
            ),
            const SizedBox(height: 8,),
            ElevatedButton(
              onPressed: (){
                showMaterialModalBottomSheet(
                    context: context,
                    expand: false,
                    elevation: 16,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Theme.of(context).colorScheme.primary,width: 10),
                        borderRadius: BorderRadius.circular(30)
                    ),
                    builder: (context){
                      return const causasSheet();
                    }
                );
              },
              child: const Text('Principais Causas',style: TextStyle(fontSize: 24,),textAlign: TextAlign.center),
              style: styleButton,
            ),
            const SizedBox(height: 8,),

            ElevatedButton(
              onPressed: (){
                showMaterialModalBottomSheet(
                    context: context,
                    expand: false,
                    elevation: 16,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Theme.of(context).colorScheme.primary,width: 10),
                        borderRadius: BorderRadius.circular(30)
                    ),
                    builder: (context){
                      return const sintomasSheet();
                    }
                );
              },
              child: const Text('Você conhece os sintomas mais comuns da Fibrilação Atrial?',style: TextStyle(fontSize: 24,),textAlign: TextAlign.center),
              style: styleButton,
            ),
            const SizedBox(height: 8,),

            ElevatedButton(
              onPressed: (){
                showMaterialModalBottomSheet(
                    context: context,
                    expand: false,
                    elevation: 16,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Theme.of(context).colorScheme.primary,width: 10),
                        borderRadius: BorderRadius.circular(30)
                    ),
                    builder: (context){
                      return const tratamentoSheet();
                    }
                );
              },
              child: const Text('Você conhece o tratamento da Fibrilação Atrial?',style: TextStyle(fontSize: 24,),textAlign: TextAlign.center),
              style: styleButton,
            ),
            const SizedBox(height: 8,),

            ElevatedButton(
              onPressed: (){
                showMaterialModalBottomSheet(
                    context: context,
                    expand: false,
                    elevation: 16,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Theme.of(context).colorScheme.primary,width: 10),
                        borderRadius: BorderRadius.circular(30)
                    ),
                    builder: (context){
                      return const prevenirSheet();
                    }
                );
              },
              child: const Text('Como prevenir e reduzir riscos de Fibrilação Atrial',style: TextStyle(fontSize: 24,),textAlign: TextAlign.center),
              style: styleButton,
            ),
            const SizedBox(height: 8,),

            ElevatedButton(
              onPressed: (){
                showMaterialModalBottomSheet(
                    context: context,
                    expand: false,
                    elevation: 16,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Theme.of(context).colorScheme.primary,width: 10),
                        borderRadius: BorderRadius.circular(30)
                    ),
                    builder: (context){
                      return TabelaSheet();
                    }
                );
              },
              child: const Text('Medicamentos que podem causar interação medicamentosa com medicações anticoagulantes',style: TextStyle(fontSize: 24,),textAlign: TextAlign.center),
              style: styleButton,
            ),
          ],
        ),
      ),
    );
  }

  Widget orientacoes(context,styleButton){
    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Container(
              width: MediaQuery.of(context).size.width/3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: ()=>setState(()=>pagina=const OqueeSheet()),
                    child: const Text('Você sabe o que é Fibrilação Atrial?',style: TextStyle(fontSize: 24,),textAlign: TextAlign.center),
                    style: styleButton,
                  ),
                  const SizedBox(height: 12,),
                  ElevatedButton(
                    onPressed: ()=>setState(()=>pagina=const TiposSheet()),
                    child: const Text('Quais os tipos de Fibrilação Atrial?',style: TextStyle(fontSize: 24,),textAlign: TextAlign.center),
                    style: styleButton,
                  ),
                  const SizedBox(height: 12,),
                  ElevatedButton(
                    onPressed: ()=>setState(()=>pagina=const oQueAconteceSheet()),
                    child: const Text('Sabe o que acontece durante a  Fibrilação Atrial?',style: TextStyle(fontSize: 24,),textAlign: TextAlign.center),
                    style: styleButton,
                  ),
                  const SizedBox(height: 12,),
                  ElevatedButton(
                    onPressed: ()=>setState(()=>pagina=const causasSheet()),
                    child: const Text('Principais Causas',style: TextStyle(fontSize: 24,),textAlign: TextAlign.center),
                    style: styleButton,
                  ),
                  const SizedBox(height: 12,),

                  ElevatedButton(
                    onPressed: ()=>setState(()=>pagina=const sintomasSheet()),
                    child: const Text('Você conhece os sintomas mais comuns da \nFibrilação Atrial?',style: TextStyle(fontSize: 24,),textAlign: TextAlign.center),
                    style: styleButton,
                  ),
                  const SizedBox(height: 12,),

                  ElevatedButton(
                    onPressed: ()=>setState(()=>pagina=const tratamentoSheet()),
                    child: const Text('Você conhece o tratamento da Fibrilação Atrial?',style: TextStyle(fontSize: 24,),textAlign: TextAlign.center),
                    style: styleButton,
                  ),
                  const SizedBox(height: 12,),

                  ElevatedButton(
                    onPressed: ()=>setState(()=>pagina=const prevenirSheet()),
                    child: const Text('Como prevenir e reduzir riscos de Fibrilação Atrial',style: TextStyle(fontSize: 24,),textAlign: TextAlign.center),
                    style: styleButton,
                  ),
                  const SizedBox(height: 12,),
                  ElevatedButton(
                    onPressed: ()=>setState(()=>pagina=TabelaSheet()),
                    child: const Text('Medicamentos que podem causar interação medicamentosa com medicações anticoagulantes',style: TextStyle(fontSize: 24,),textAlign: TextAlign.center),
                    style: styleButton,
                  ),
                ],
              ),
            ),
          Container(
            padding: EdgeInsets.all(12),
              width: ((MediaQuery.of(context).size.width/3)*2),
              child: pagina,
          )
        ],
      ),
    );
  }
}
