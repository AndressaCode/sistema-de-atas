import 'package:flutter/material.dart';


class VisualizarAgendamento extends StatefulWidget {
  @override
  _VisualizarAgendamentoState createState() => _VisualizarAgendamentoState();
}

class _VisualizarAgendamentoState extends State<VisualizarAgendamento> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text("Visualizar agendamentos", style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),),
      ),
    );
  }
}
