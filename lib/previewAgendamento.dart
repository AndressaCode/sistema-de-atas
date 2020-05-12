import 'package:flutter/material.dart';
import 'package:prototiposistemadeatas/agendarReuniao.dart';
import 'package:prototiposistemadeatas/confirmarAgendamento.dart';

class PreviewAgendamento extends StatefulWidget {
  @override
  _PreviewAgendamentoState createState() => _PreviewAgendamentoState();
}

class _PreviewAgendamentoState extends State<PreviewAgendamento> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Container(
                width: 800.0,
                height: 700.0,
                color: Colors.grey[200],
                child: Center(
                  child: Container(
                    width: 550.0,
                    height: 600.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text("Dado "),
                            SizedBox(width: 10.0,),
                            Container(
                              color: Colors.grey,
                              width: 500.0,
                              height: 30.0,
                            ),
                          ],
                        ),
                        SizedBox(height: 30.0,),
                        Row(
                          children: [
                            Text("Dado "),
                            SizedBox(width: 10.0,),
                            Container(
                              color: Colors.grey,
                              width: 500.0,
                              height: 30.0,
                            ),
                          ],
                        ),
                        SizedBox(height: 30.0,),
                        Row(
                          children: [
                            Text("Dado "),
                            SizedBox(width: 10.0,),
                            Container(
                              color: Colors.grey,
                              width: 500.0,
                              height: 30.0,
                            ),
                          ],
                        ),
                        SizedBox(height: 30.0,),
                        Row(
                          children: [
                            Text("Dado "),
                            SizedBox(width: 10.0,),
                            Container(
                              color: Colors.grey,
                              width: 500.0,
                              height: 30.0,
                            ),
                          ],
                        ),
                        SizedBox(height: 30.0,),
                        Row(
                          children: [
                            Text("Dado "),
                            SizedBox(width: 10.0,),
                            Container(
                              color: Colors.grey,
                              width: 500.0,
                              height: 30.0,
                            ),
                          ],
                        ),
                        SizedBox(height: 30.0,),
                        Row(
                          children: [
                            Text("Dado "),
                            SizedBox(width: 10.0,),
                            Container(
                              color: Colors.grey,
                              width: 500.0,
                              height: 30.0,
                            ),
                          ],
                        ),
                        SizedBox(height: 30.0,),
                        Row(
                          children: [
                            Text("Dado "),
                            SizedBox(width: 10.0,),
                            Container(
                              color: Colors.grey,
                              width: 500.0,
                              height: 30.0,
                            ),
                          ],
                        ),
                        SizedBox(height: 30.0,),
                        Row(
                          children: [
                            Text("Dado "),
                            SizedBox(width: 10.0,),
                            Container(
                              color: Colors.grey,
                              width: 500.0,
                              height: 30.0,
                            ),
                          ],
                        ),
                        SizedBox(height: 30.0,),
                        Row(
                          children: [
                            Text("Dado "),
                            SizedBox(width: 10.0,),
                            Container(
                              color: Colors.grey,
                              width: 500.0,
                              height: 30.0,
                            ),
                          ],
                        ),
                        SizedBox(height: 30.0,),
                        Row(
                          children: [
                            Text("Dado "),
                            SizedBox(width: 10.0,),
                            Container(
                              color: Colors.grey,
                              width: 500.0,
                              height: 30.0,
                            ),
                          ],
                        ),
                        SizedBox(height: 30.0,),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton.icon(
                  onPressed: (){
                    Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => ConfirmarAgendamento(),
                      ),);
                  },
                  color: Color(0xFF2c3e50),
                  icon: Icon(Icons.event_available, color: Colors.white,),
                  label: Text("Confirmar", style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),),
                ),
                SizedBox(width: 20.0,),
                FlatButton.icon(
                  onPressed: (){
                    Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => AgendarReuniao(),
                      ),);
                  },
                  color: Color(0xFF2c3e50),
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
                  label: Text("Voltar", style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),),
                ),
              ],
            ),
          ]
      ),
    );
  }
}
