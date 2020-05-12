import 'package:flutter/material.dart';

class GerarRelatorio extends StatefulWidget {
  @override
  _GerarRelatorioState createState() => _GerarRelatorioState();
}

class _GerarRelatorioState extends State<GerarRelatorio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text("Gerar Relatórios", style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),),
      ),
    );
  }
}
