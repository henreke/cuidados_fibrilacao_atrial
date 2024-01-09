import 'package:cuidados_fibrilacao_atrial/blocs/avaliacao_manager.dart';
import 'package:cuidados_fibrilacao_atrial/blocs/user_manager.dart';
import 'package:cuidados_fibrilacao_atrial/data/avaliacao.dart';
import 'package:cuidados_fibrilacao_atrial/data/perguntas.dart';
import 'package:cuidados_fibrilacao_atrial/widgets/tile_perguntas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AutoAvaliacaoScreen extends StatefulWidget {
  AutoAvaliacaoScreen({Key? key}) : super(key: key);

  List<Perguntas> perguntas = Avaliacao.perguntas_const;
  @override
  State<AutoAvaliacaoScreen> createState() => _AutoAvaliacaoScreenState();
}

class _AutoAvaliacaoScreenState extends State<AutoAvaliacaoScreen> {
  UserManager? _userManager;
  AvaliacaoManager avaliacao_manager = AvaliacaoManager();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final UserManager userManager = Provider.of<UserManager>(context);
    if (_userManager != userManager) {
      _userManager = userManager;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Perguntas> _perguntas = widget.perguntas;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auto Avaliação'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TilePerguntas(indice: 0, perguntas: _perguntas),
            TilePerguntas(indice: 1, perguntas: _perguntas),
            TilePerguntas(indice: 2, perguntas: _perguntas),
            TilePerguntas(indice: 3, perguntas: _perguntas),
            TilePerguntas(indice: 4, perguntas: _perguntas),
            TilePerguntas(indice: 5, perguntas: _perguntas),
            TilePerguntas(indice: 6, perguntas: _perguntas),
            TilePerguntas(indice: 7, perguntas: _perguntas),
            TilePerguntas(indice: 8, perguntas: _perguntas),
            TilePerguntas(indice: 9, perguntas: _perguntas),
            StreamBuilder<bool>(
                stream: avaliacao_manager.isLoading,
                builder: (context,snapshot) {
                  bool _isLoading = snapshot.hasData ? snapshot.data! : false;
                  if (!_isLoading) {
                    return ElevatedButton(
                        onPressed: () {

                          Avaliacao avaliacao = Avaliacao(
                              perguntas: _perguntas, idPaciente: _userManager!.uid);
                          avaliacao_manager.cadAvaliacao(
                              avaliacao: avaliacao, onSuccess: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Sua avaliação foi enviada com sucesso!'),
                                ));
                          }, onFail: () {});
                        },
                        child: Text('Enviar'),
                      style: ButtonStyle(
                          textStyle: MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.pressed)){
                              return TextStyle(color: Colors.black);
                            }
                            return TextStyle(color: Colors.white);
                          }),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                          backgroundColor: MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.pressed)){
                              return Colors.green[50];
                            }
                            return Theme.of(context).primaryColor;
                          })
                      ),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.green),
                    ),
                  );
                }
            ),

          ],
        ),
      ),
    );
  }


}
