import 'package:flutter/material.dart';

class AnexarArquivo extends StatefulWidget {
  @override
  _AnexarArquivoState createState() => _AnexarArquivoState();
}

class _AnexarArquivoState extends State<AnexarArquivo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text(
          //"Anexar documentos a ata",
          //style: TextStyle(
            //color: Colors.white,
            //fontSize: 16.0
          //),
        //),
        backgroundColor: Color(0xFF2c3e50),
      ),
      body: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Center(
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 400.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFbdc3c7),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Text(
                      "Selecionar documentos"
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
