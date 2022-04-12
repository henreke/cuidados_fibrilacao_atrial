import 'package:cuidados_fibrilacao_atrial/blocs/exame_manager.dart';
import 'package:cuidados_fibrilacao_atrial/blocs/user_manager.dart';
import 'package:cuidados_fibrilacao_atrial/data/exame.dart';
import 'package:cuidados_fibrilacao_atrial/data/paciente.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';
class HistoricoExamesScreen extends StatefulWidget {

  final Paciente? paciente;
  const HistoricoExamesScreen({Key? key, this.paciente}) : super(key: key);

  @override
  State<HistoricoExamesScreen> createState() => _HistoricoExamesScreenState();
}

class _HistoricoExamesScreenState extends State<HistoricoExamesScreen> {


  UserManager? _userManager;
  ExameManager _exameManager = ExameManager();

  late int showingTooltip;

  @override
  void initState() {
    showingTooltip = -1;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final UserManager userManager = Provider.of<UserManager>(context);
    if (_userManager != userManager) {
      _userManager = userManager;
      _exameManager.getListaExamesPaciente(id: widget.paciente!.uid!, idUser: _userManager!.uid);
    }
  }
  BarChartGroupData generateGroupData(int x, int y) {
    return BarChartGroupData(
      x: x,
      showingTooltipIndicators: showingTooltip == x ? [0] : [],
      barRods: [
        BarChartRodData(toY: y.toDouble()),
        BarChartRodData(toY: 2*y.toDouble()),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const Text('Histórico'),
            Text(widget.paciente!.nome!),
          ],
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: AspectRatio(
            aspectRatio: 2,
            child: StreamBuilder<List<Exame>>(
              stream: _exameManager.listaExamesPaciente,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.isNotEmpty) {
                      return BarChart(BarChartData(
                          barGroups: snapshot.data!
                              .map<BarChartGroupData>((exame) =>
                                  generateGroupData(exame.id!, exame.valor!))
                              .toList(),
                        barTouchData: BarTouchData(
                            enabled: true,
                            handleBuiltInTouches: false,
                            touchCallback: (event, response) {
                              if (response != null && response.spot != null && event is FlTapUpEvent) {
                                setState(() {
                                  final x = response.spot!.touchedBarGroup.x;
                                  final isShowing = showingTooltip == x;
                                  if (isShowing) {
                                    showingTooltip = -1;
                                  } else {
                                    showingTooltip = x;
                                  }
                                });
                              }
                            },
                            mouseCursorResolver: (event, response) {
                              return response == null || response.spot == null
                                  ? MouseCursor.defer
                                  : SystemMouseCursors.click;
                            }
                        ),

                      )
                      );
                    } else{
                    return Container();
                  }
                  } else {
                  return Container();
                }
              }
            ),
          ),
        ),
      ),
    );
  }
}
