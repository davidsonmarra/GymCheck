import 'package:flutter/material.dart';
import 'package:gym_check/components/workout-list-item.dart';
import 'package:gym_check/data/exercicio_operations.dart';
import 'package:gym_check/models/exercicio.dart';

import 'package:gym_check/screens/home.dart';
import 'package:gym_check/screens/qr-code-reader.dart';
import 'package:gym_check/screens/workout-details.dart';
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

  @override
  void initState() {
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
              hintText: 'N??mero de S??ries',
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
              hintText: 'N??mero de Repeti????es',
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
              hintText: 'Tempo de Exerc??cio',
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
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
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
        title: const Text('Adicionar Exerc??cio'),
      ),
      body: const MyStatefulWidget(),
    );
  }
}
