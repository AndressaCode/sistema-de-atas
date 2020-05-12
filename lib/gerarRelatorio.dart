import 'package:flutter/material.dart';
import 'package:prototiposistemadeatas/sairUsuario.dart';

class GerarRelatorio extends StatefulWidget {
  @override
  _GerarRelatorioState createState() => _GerarRelatorioState();
}

class _GerarRelatorioState extends State<GerarRelatorio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2c3e50),
        title: Text("Gerar Relatórios", style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(100.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Sistema de Atas Eletrônicas",
                  style: TextStyle(
                      color: Color(0xFF2c3e50),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Selecione relatórios que deseja gerar",
                    style: TextStyle(
                      color: Color(0xFF2c3e50),
                      fontSize: 20.0,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                // Container com os botoes principais
                Container(
                  width: 400.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFbdc3c7),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        width: 200.0,
                        height: 40.0,
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GerarRelatorio(),
                              ),
                            );
                          },
                          color: Color(0xff34495e),
                          child: Text(
                            'Visualizar agendamentos',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        width: 200.0,
                        height: 40.0,
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GerarRelatorio(),
                              ),
                            );
                          },
                          color: Color(0xff34495e),
                          child: Text(
                            'Visualizar Atas Geradas',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        width: 200.0,
                        height: 40.0,
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GerarRelatorio(),
                              ),
                            );
                          },
                          color: Color(0xff34495e),
                          child: Text(
                            'Reuniões por período',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        width: 200.0,
                        height: 40.0,
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GerarRelatorio(),
                              ),
                            );
                          },
                          color: Color(0xff34495e),
                          child: Text(
                            'Reuniões sobrestadas',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50.0,),
                // Container com o botao sair
                Container(
                  width: 100.0,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
