import 'package:flutter/material.dart';

class VisualizarExamesScreen extends StatefulWidget {
  const VisualizarExamesScreen({Key? key}) : super(key: key);

  @override
  State<VisualizarExamesScreen> createState() => _VisualizarExamesScreenState();
}

class _VisualizarExamesScreenState extends State<VisualizarExamesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visualizar Exames'),
        centerTitle: true,
      ),
    );
  }
}
