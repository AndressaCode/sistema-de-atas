import 'package:flutter/material.dart';

class SairUsuario extends StatefulWidget {
  @override
  _SairUsuarioState createState() => _SairUsuarioState();
}

class _SairUsuarioState extends State<SairUsuario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Sair", style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),),
      ),
    );
  }
}
