import 'package:flutter/material.dart';
import 'package:gym_check/data/exercicio_operations.dart';
import 'package:gym_check/models/exercicio.dart';

import 'package:gym_check/screens/home.dart';
import 'package:gym_check/screens/qr-code-reader.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController _textEditingControllerNome = TextEditingController();
  TextEditingController _textEditingControllerNumSeries =
      TextEditingController();
  TextEditingController _textEditingControllerNumRepeticoes =
      TextEditingController();
  TextEditingController _textEditingControllerTempoExrc =
      TextEditingController();
  TextEditingController _textEditingControllerTempoDescanso =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ExercicioOperations exercicioOperations = ExercicioOperations();

  // _recuperarBancoDados() async {
  //   final caminhoDB = await getDatabasesPath();
  //   final localDB = join(caminhoDB, 'gym_check.db');
  //   var retorno = await openDatabase(
  //     localDB,
  //     version: 1,
  //     onCreate: (db, dbVersaoRecente) {
  //       String sql = 'CREATE TABLE Exer ('
  //           'id INTEGER PRIMARY KEY AUTOINCREMENT,'
  //           'nome VARCHAR,'
  //           'num_series INTEGER,'
  //           'num_repeticoes INTEGER,'
  //           'temp_exercicio INTEGER,'
  //           'temp_descanso INTEGER'
  //           ')';
  //       db.execute(sql);
  //     },
  //   );
  //   print("Aberto: " + retorno.isOpen.toString());
  //   return retorno;
  // }

  // _createExercicio(Exercicio exrc) async {
  //   print('exrc.nome13212');
  //   Database bd = await _recuperarBancoDados();
  //   Map<String, dynamic> dadosExer = {
  //     "nome": exrc.nome,
  //     "num_series": exrc.numSeries,
  //     "num_repeticoes": exrc.numRepeticoes,
  //     "temp_exercicio": exrc.tempExercicio,
  //     "temp_descanso": exrc.tempDescanso,
  //   };
  //   print(dadosExer.toString());
  //   int id = await bd.insert("Exer", dadosExer);
  //   print("Salvo: $id");
  // }

  // _getAllExercises() async {
  //   Database bd = await _recuperarBancoDados();
  //   String sql = "SELECT * FROM Exer";
  //   List exercicios = await bd.rawQuery(sql);
  //   print(exercicios);
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    exercicioOperations.getAllExercises();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Nome',
            ),
            textAlign: TextAlign.center,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            controller: _textEditingControllerNome,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Número de Séries',
            ),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            controller: _textEditingControllerNumSeries,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Número de Repetições',
            ),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            controller: _textEditingControllerNumRepeticoes,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Tempo de Exercício',
            ),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            controller: _textEditingControllerTempoExrc,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Tempo de descanso',
            ),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            controller: _textEditingControllerTempoDescanso,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  Exercicio exrc = Exercicio(
                    _textEditingControllerNome.text,
                    int.parse(_textEditingControllerNumSeries.text),
                    int.parse(_textEditingControllerNumRepeticoes.text),
                    int.parse(_textEditingControllerTempoExrc.text),
                    int.parse(_textEditingControllerTempoDescanso.text),
                  );
                  await exercicioOperations.createExercicio(exrc);
                }
              },
              child: const Text('Enviar'),
            ),
          ),
        ],
      ),
    );
  }
}

class AddExercise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Exercício'),
      ),
      body: const MyStatefulWidget(),
    );
  }
}
