import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'confirmarAgendamento.dart';

class ReuniaoExtraordinaria extends StatefulWidget {
  @override
  _ReuniaoExtraordinariaState createState() => _ReuniaoExtraordinariaState();
}

class _ReuniaoExtraordinariaState extends State<ReuniaoExtraordinaria> {


  TimeOfDay _time = TimeOfDay.now();
  TimeOfDay pickedTime;

  Future<Null> selectTime (BuildContext context) async{
    pickedTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    setState(() {
      _time = pickedTime;
      print(_time);
    });
  }

  TimeOfDay _timeF = TimeOfDay.now();
  TimeOfDay pickedTimeF;

  Future<Null> selectTimeF (BuildContext context) async{
    pickedTimeF = await showTimePicker(
      context: context,
      initialTime: _timeF,
    );
    setState(() {
      _timeF = pickedTimeF;
      print(_timeF);
    });
  }

  DateTime _date = DateTime.now();

  Future<Null> selectedDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2020),
        lastDate: DateTime(2021)
    );
    if (picked != null && picked != _date){
      setState(() {
        _date = picked;
        print(_date.toString());
      });
    }
  }


  final _itemController = TextEditingController();

  List _itensDePauta = [];
  Map<String, dynamic> _lastRemoved;
  int _lastRemovedPos;


  @override
  void initState() {
    super.initState();

    _readData().then((data) {
      setState(() {
        _itensDePauta = json.decode(data);
      });
    });
  }

  void _addItem() {
    setState(() {
      Map<String, dynamic> newItem = Map();
      newItem["title"] = _itemController.text;
      _itemController.text = "";
      newItem["ok"] = false;
      _itensDePauta.add(newItem);
      _savedData();
    });
  }

  var selectedType, selectedPessoa, selectedResponsavel;

  List<String> _convocados = <String>[
    'Adriano Bio',
    'Andressa Silva de Souza',
    'George Barbalho da Silva Sauro',
    'Jetson Edson',
    'Marcelo Arquiteto',
    'Thiago Dutra',
    'Thompson Pereira',
    'Wellington Costa',
    'Wendel Irmão',
  ];

  List<String> _responsaveis = <String>[
    'Adriano Bio',
    'Andressa Silva de Souza',
    'George Barbalho da Silva Sauro',
    'Jetson Edson',
    'Marcelo Arquiteto',
    'Thiago Dutra',
    'Thompson Pereira',
    'Wellington Costa',
    'Wendel Irmão',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2c3e50),
        title: Text(
            "Reunião extraordinária", style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Botoes de tipo reuniao e usuario cadastrador
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 100.0, width: 10.0,),
              // Texto tipo de reunião
              Container(
                width: 120,
                height: 30,
                decoration: BoxDecoration(
                  //color: Colors.brown[50],
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Center(
                  child: Text("Tipo de reunião", style: TextStyle(
                      color: Color(0xFF2c3e50),
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold
                  ),),
                ),
              ),
              // Selecionar tipo de reunião
              Container(
                width: 180.0,
                height: 30,
                decoration: BoxDecoration(
                  color: Color(0xFFbdc3c7),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Center(child: Text("Reunião Extraordinária")),
              ),
            ],
          ),
          /*------------------------- IDENTIFICAÇÃO DA REUNIÃO --------------*/

          Center(
            child: Text("Identificação da reunião", style: TextStyle(
              color: Colors.grey,
              fontSize: 12.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
          SizedBox(height: 20.0,),
          // TEXTO DATA/HORA
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Text Data e hora
                Container(
                  width: 100.0,
                  height: 50.0,
                  //color: Colors.brown[100],
                  child: Center(
                    child: Text("Data/Hora", style: TextStyle(
                        color: Color(0xFF2c3e50),
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
                // Campo de data e hora
                SizedBox(width: 5.0,),
                // -------------------------------------------- Inserir Data
                Expanded(
                  child: Container(
                    //padding: EdgeInsets.only(left: 10.0),
                    height: 30.0,
                    color: Color(0xFFecf0f1),
                    child: Center(
                      child: FlatButton.icon(
                        onPressed: () {
                          selectedDate(context);
                        },
                        label: Text('Data'),
                        icon: Icon(Icons.event, color: Color(0xFF2c3e50),
                          size: 30.0,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5.0,),
                // // ---------------------------------------- Texto "Início"
                Container(
                  width: 100.0,
                  height: 50.0,
                  //color: Colors.brown[100],
                  child: Center(
                    child: Text("Inicio", style: TextStyle(
                        color: Color(0xFF2c3e50),
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
                // campo de hora inicio
                SizedBox(width: 5.0,),
                // ----------------------------------- Inserir horário inicial
                Expanded(
                  child: Container(
                    //padding: EdgeInsets.only(left: 10.0),
                    height: 30.0,
                    color: Color(0xFFecf0f1),
                    child: Center(
                      child: FlatButton.icon(
                        onPressed: () {
                          selectTime(context);
                        },
                        label: Text('Hora'),
                        icon: Icon(Icons.schedule, color: Color(0xFF2c3e50),
                          size: 30.0,
                        ),
                      ),
                    ),
                  ),
                ),
                // campo de hora fim
                SizedBox(width: 5.0,),
                // ----------------------------------------------- Texto "Até"
                Container(
                  width: 60.0,
                  height: 50.0,
                  //color: Colors.brown[100],
                  child: Center(
                    child: Text("Até", style: TextStyle(
                        color: Color(0xFF2c3e50),
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
                SizedBox(width: 5.0,),
                // ----------------------------------- Inserir horário final
                Expanded(
                  child: Container(
                    //padding: EdgeInsets.only(left: 10.0),
                    height: 30.0,
                    color: Color(0xFFecf0f1),
                    child: Center(
                      child: FlatButton.icon(
                        onPressed: () {
                          selectTimeF(context);
                        },
                        label: Text('Hora'),
                        icon: Icon(Icons.schedule, color: Color(0xFF2c3e50),
                          size: 30.0,
                        ),
                      ),
                    ),
                  ),
                ),
                // text local
                SizedBox(width: 5.0,),
                // ----------------------------------- Texto Local da reunião
                Container(
                  width: 150.0,
                  height: 30.0,
                  //color: Colors.brown[100],
                  child: Center(
                    child: Text(
                      "Local de reunião", style: TextStyle(
                        color: Color(0xFF2c3e50),
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold
                    ),
                    ),
                  ),
                ),
                // Campo de colocar local
                SizedBox(width: 5.0,),
                // ----------------------------------- Inserir local de reunião
                Expanded(
                  child: Container(
                    //padding: EdgeInsets.only(left: 10.0),
                    height: 30.0,
                    color: Color(0xFFecf0f1),
                    child: Center(
                      child: TextField(
                        //autofocus: true,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          color: Color(0xFF2c3e50),
                          fontSize: 15.0,
                        ),
                        decoration: InputDecoration(
                          //border: InputBorder.none,
                            hintText: "Local de reunião"
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 30.0,),
              ],
            ),
          ),

          /*--------------------FIM IDENTIFICAÇÃO DA REUNIÃO ----------------*/

          /*--------------------INICIO OBJETIVO DA REUNIÃO ----------------*/
          SizedBox(height: 20.0,),
          // ------------------------ TEXTO OBJETIVOS
          Center(
            child: Text("Objetivos", style: TextStyle(
              color: Colors.grey,
              fontSize: 12.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100.0,
                  height: 50.0,
                  child: Center(
                    child: Text("Objetivo", style: TextStyle(
                        color: Color(0xFF2c3e50),
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
                // ------------------------ Inserir objetivo de reunião
                Expanded(
                  child: Container(
                    //padding: EdgeInsets.only(left: 10.0),
                    height: 30.0,
                    color: Color(0xFFecf0f1),
                    child: Center(
                      child: TextField(
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          color: Color(0xFF2c3e50),
                          fontSize: 15.0,
                        ),
                        decoration: InputDecoration(
                          hintText: "Informe objetivo para a reunião",
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 30.0,),
              ],
            ),
          ),
          /*--------------------- FIM OBJETIVO DA REUNIÃO ----------------*/
/*-------------------- PARTICIPANTES DA REUNIÃO ----------------*/

          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100.0,
                  height: 50.0,
                  child: Center(
                    child: Text("Participantes", style: TextStyle(
                        color: Color(0xFF2c3e50),
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
                Expanded(
                  child: Container(
                    //padding: EdgeInsets.only(left: 10.0),
                    height: 30.0,
                    color: Color(0xFFecf0f1),
                    child: DropdownButton(
                      items: _convocados
                          .map((value) => DropdownMenuItem(
                        child: Text(
                          value,
                          style: TextStyle(color: Color(0xFF2c3e50),),
                        ),
                        value: value,
                      ))
                          .toList(),
                      onChanged: (selectedConvocados){
                        print('$selectedConvocados');
                        setState(() {
                          selectedConvocados = selectedConvocados;
                        });
                        setState(() {
                          selectedPessoa = selectedConvocados;
                        });
                      },
                      value: selectedPessoa,
                      isExpanded: true,
                      hint: Text('Selecione participantes',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 30.0),
              ],
            ),
          ),

          /*--------------- FIM PARTICIPANTES DE REUNIÃO ----------------*/

          /*--------------------- RESPONSÁVEL DE REUNIÃO ----------------*/
          // Texto "Responsável"
          Center(
            child: Text("Solicitante da reunião", style: TextStyle(
              color: Colors.grey,
              fontSize: 12.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100.0,
                  height: 50.0,
                  child: Center(
                    child: Text("Responsável", style: TextStyle(
                        color: Color(0xFF2c3e50),
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
                // ------------------------ NOME DO RESPONSÁVEL REUNIÃO
                Expanded(
                  child: Container(
                    //padding: EdgeInsets.only(left: 10.0),
                    height: 30.0,
                    color: Color(0xFFecf0f1),
                    child: Container(
                      //padding: EdgeInsets.only(left: 10.0),
                      height: 30.0,
                      color: Color(0xFFecf0f1),
                      child: DropdownButton(
                        items: _responsaveis
                            .map((value) => DropdownMenuItem(
                          child: Text(
                            value,
                            style: TextStyle(color: Color(0xFF2c3e50),),
                          ),
                          value: value,
                        ))
                            .toList(),
                        onChanged: (selectedResponsaveis){
                          print('$selectedResponsaveis');
                          setState(() {
                            selectedResponsaveis = selectedResponsaveis;
                          });
                          setState(() {
                            selectedResponsavel = selectedResponsaveis;
                          });
                        },
                        value: selectedResponsavel,
                        isExpanded: true,
                        hint: Text('Selecione Responsável',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 30.0,),
              ],
            ),
          ),
          /*----------------- FIM RESPONSÁVEL DE REUNIÃO ----------------*/
          /*------------------ INÍCIO PAUTA DE REUNIÃO -----------------*/
          Center(
            child: Text(
              "Itens que serão discutidos em reunião", style: TextStyle(
              color: Colors.grey,
              fontSize: 12.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              height: 250.0,
              child: Column(
                children: [
                  Flexible(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 100.0,
                          height: 50.0,
                          child: Center(
                            child: Text("Pauta", style: TextStyle(
                                color: Color(0xFF2c3e50),
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold
                            ),),
                          ),
                        ),
                        // ------------------------ Inserir itens de pauta
                        Expanded(
                          child: Container(
                            height: 30.0,
                            color: Color(0xFFecf0f1),
                            child: Center(
                              child: TextField(
                                controller: _itemController,
                                keyboardType: TextInputType.text,
                                style: TextStyle(
                                  color: Color(0xFF2c3e50),
                                  fontSize: 15.0,
                                ),
                                decoration: InputDecoration(
                                  hintText: "Novo item da pauta",
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 5.0,),

                        // Boão adicionar item de pauta

                        Container(
                          padding: EdgeInsets.only(left: 5.0),
                          width: 70.0,
                          height: 30.0,
                          child: FlatButton(
                            onPressed: _addItem,
                            color: Color(0xFFbdc3c7),
                            child: Text("ADD", style: TextStyle(
                                color: Color(0xFF2c3e50),
                                fontSize: 12.0
                            ),),
                          ),
                        ),
                        SizedBox(width: 30.0,),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        padding: EdgeInsets.only(top: 5.0),
                        itemCount: _itensDePauta.length,
                        itemBuilder: buildItem
                    ),
                  ),
                  // TEXTO PAUTA, TEXTFIELD ADD ITEM DE PAUTA, BOTAO ADD

                  /* ------------------------ LISTVIEW
               -------------------- FIM PAUTA DE REUNIÃO -----------------*/
                ],
              ),
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => ConfirmarAgendamento(),
                      ),);
                  },
                  color: Color(0xFF2c3e50),
                  icon: Icon(Icons.event_available, color: Colors.white,),
                  label: Text("Agendar reunião", style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),),
                ),
                SizedBox(width: 10.0,),
                FlatButton.icon(
                  onPressed: () {},
                  color: Colors.red,
                  icon: Icon(Icons.cancel, color: Colors.white,),
                  label: Text("Cancelar", style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),),
                ),
              ]
          ),
          /*FlatButton.icon(
              onPressed: (){},
              icon: Icon(Icons.add),
              label: Text(
                "Anexar documentos a ata"
              ),
          ),*/
        ],
      ),
    );
  }

  Widget buildItem(context, index) {
    return Dismissible(
      key: Key(DateTime
          .now()
          .millisecondsSinceEpoch
          .toString()),
      background: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment(-0.9, 0.0),
          child: Icon(Icons.delete, color: Colors.white,),
        ),
      ),
      direction: DismissDirection.startToEnd,
      child: CheckboxListTile(
        title: Text(_itensDePauta[index]["title"]),
        value: _itensDePauta[index]["ok"],
        //secondary: CircleAvatar(
        //child: Icon(_itensDePauta[index]["ok"] ?
        //Icons.check : Icons.error),
        //),
        onChanged: (c) {
          setState(() {
            _itensDePauta[index]["ok"] = c;
            _savedData();
          });
        },
      ),
      onDismissed: (direction) {
        setState(() {
          _lastRemoved = Map.from(_itensDePauta[index]);
          _lastRemovedPos = index;
          _itensDePauta.removeAt(index);

          _savedData();

          final snack = SnackBar(
            content: Text("Item \"${_lastRemoved["title"]}\" removido"),
            action: SnackBarAction(label: "Desfazer",
                onPressed: () {
                  setState(() {
                    _itensDePauta.insert(_lastRemovedPos, _lastRemoved);
                    _savedData();
                  });
                }),
            duration: Duration(seconds: 4),
          );

          Scaffold.of(context).showSnackBar(snack);
        }
        );
      },
    );
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  // pega a lista, transformando a lista em um json e armazenando
  // numa String data

  // Salvar dados no arquivo
  Future<File> _savedData() async {
    String data = json.encode(_itensDePauta);
    final file = await _getFile();
    return file.writeAsString(data);
  }

  // Ler arquivo
  Future<String> _readData() async {
    try {
      final file = await _getFile();

      return file.readAsString();
    } catch (e) {
      return null;
    }
  }
}
