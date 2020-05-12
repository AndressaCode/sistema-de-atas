import 'package:flutter/material.dart';
import 'package:prototiposistemadeatas/main.dart';
import 'package:prototiposistemadeatas/sairUsuario.dart';


class ConfirmarAgendamento extends StatefulWidget {
  @override
  _ConfirmarAgendamentoState createState() => _ConfirmarAgendamentoState();
}

class _ConfirmarAgendamentoState extends State<ConfirmarAgendamento> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2c3e50),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30.0,),
          Text("Reunião agendada",
            style: TextStyle(
                color: Color(0xFF2c3e50),
                fontSize: 20.0,
                fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30.0,),
          Center(
            child: Container(
              width: 400.0,
              height: 200.0,
              decoration: BoxDecoration(
                color: Color(0xFFbdc3c7),
                borderRadius: BorderRadius.circular(20.0),
              ),
                child: Center(
                  child: Text("E-mails enviados aos convocados",
                  style: TextStyle(
                      color: Color(0xFF2c3e50),
                  fontSize: 16.0,
                  fontStyle: FontStyle.italic,
              ),
            ),
                ),
          ),
          ),
          SizedBox(height: 30.0,),

          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150.0,
                  height: 30.0,
                  child: FlatButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ),
                      );
                    },
                    color: Color(0xFF2c3e50),
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    label: Text(
                      "Voltar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 10.0,),
                Container(
                  width: 150.0,
                  height: 30.0,
                  child: FlatButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SairUsuario(),
                        ),
                      );
                    },
                    color: Color(0xFF2c3e50),
                    icon: Icon(Icons.exit_to_app, color: Colors.white),
                    label: Text(
                      "Sair",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ]
          ),
        ],
      ),
    );
  }
}
