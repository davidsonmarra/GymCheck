import 'package:flutter/material.dart';
import 'package:gym_check/data/exercicio_operations.dart';
import 'package:gym_check/models/exercicio.dart';
import 'package:gym_check/screens/home.dart';

class ExerciseDetails extends StatelessWidget {
  final Exercicio exercicio;
  final int id;

  ExerciseDetails(this.exercicio, this.id, {super.key});

  ExercicioOperations exerc = ExercicioOperations();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(exercicio.nome), actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.delete),
          tooltip: 'Deletar Exercício',
          onPressed: () async {
            await exerc.deleteExercise(id);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
        ),
      ]),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [Text('')],
              ),
              Row(
                children: [
                  Icon(
                    Icons.fitness_center_rounded,
                    color: Colors.red,
                    size: 32,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                  Text(
                    '  Nome: ' + exercicio.nome,
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
              Row(
                children: [Text('')],
              ),
              Row(
                children: [
                  Icon(
                    Icons.replay_rounded,
                    color: Colors.red,
                    size: 32,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                  Text(
                    '  Número de séries: ' + exercicio.numRepeticoes.toString(),
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
              Row(
                children: [Text('')],
              ),
              Row(
                children: [
                  Icon(
                    Icons.repeat,
                    color: Colors.red,
                    size: 32,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                  Text(
                    '  Número de séries: ' + exercicio.numSeries.toString(),
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
              Row(
                children: [Text('')],
              ),
              Row(
                children: [
                  Icon(
                    Icons.alarm_off,
                    color: Colors.red,
                    size: 32,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                  Text(
                    '  Tempo de Descanso: ' +
                        exercicio.tempDescanso.toString() +
                        's',
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
              Row(
                children: [Text('')],
              ),
              Row(
                children: [
                  Icon(
                    Icons.schedule,
                    color: Colors.red,
                    size: 32,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                  Text(
                    '  Tempo de Execução: ' +
                        exercicio.tempExercicio.toString() +
                        's',
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
