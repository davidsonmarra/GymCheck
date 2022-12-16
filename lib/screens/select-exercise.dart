import 'package:flutter/material.dart';
import 'package:gym_check/components/exercise-item.dart';
import 'package:gym_check/components/workout-list-item.dart';
import 'package:gym_check/data/exercicio_operations.dart';
import 'package:gym_check/data/ficha_operations.dart';
import 'package:gym_check/models/exercicio.dart';
import 'package:gym_check/models/ficha.dart';
import 'package:gym_check/screens/add-exercise.dart';
import 'package:gym_check/screens/qr-code-reader.dart';
import 'package:gym_check/screens/workout-details.dart';
import 'package:gym_check/screens/workout.dart';

class SelectExercise extends StatefulWidget {
  final Ficha ficha;
  final int fichaId;
  const SelectExercise(this.ficha, this.fichaId, {super.key});

  @override
  State<SelectExercise> createState() => _SelectExerciseState();
}

class _SelectExerciseState extends State<SelectExercise> {
  ExercicioOperations exercicioOperations = ExercicioOperations();
  FichaOperations fichaOperations = FichaOperations();

  var exercises = [];

  void loadExercises() async {
    var _exercises = await exercicioOperations.getAllExercises();
    setState(() {
      exercises = _exercises;
    });
    print(exercises);
  }

  void addExerciseToWorkout(int exerciseId) async {
    // print(exerciseId);
    await fichaOperations.addFichaAndExercicio(widget.fichaId, exerciseId);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                WorkoutDetails(widget.ficha, widget.fichaId)));
  }

  @override
  void initState() {
    super.initState();
    loadExercises();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Selecionar Exercicios')),
      body: Center(
        child: Column(
          children: [
            exercises.length > 0
                ? Expanded(
                    child: ListView.builder(
                      itemCount: exercises.length,
                      itemBuilder: (context, index) {
                        return ExerciseItem(
                          exercises[index]['id'],
                          Exercicio(
                              exercises[index]['nome'],
                              exercises[index]['num_series'],
                              exercises[index]['num_repeticoes'],
                              exercises[index]['temp_exercicio'],
                              exercises[index]['temp_descanso']),
                          addExerciseToWorkout,
                        );
                      },
                    ),
                  )
                : const Text('Nenhum exercício encontrado'),
          ],
        ),
      ),
    );
  }
}
