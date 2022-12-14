import 'package:flutter/material.dart';
import 'package:gym_check/components/exercise-item.dart';
import 'package:gym_check/data/ficha_operations.dart';
import 'package:gym_check/models/exercicio.dart';
import 'package:gym_check/models/ficha.dart';
import 'package:gym_check/screens/add-exercise.dart';
import 'package:gym_check/screens/exercise-details.dart';
import 'package:gym_check/screens/home.dart';
import 'package:gym_check/screens/select-exercise.dart';
import 'package:gym_check/screens/workout.dart';

class WorkoutDetails extends StatefulWidget {
  final Ficha ficha;
  final int fichaId;
  const WorkoutDetails(this.ficha, this.fichaId, {super.key});

  @override
  State<WorkoutDetails> createState() => _WorkoutDetailsState();
}

class _WorkoutDetailsState extends State<WorkoutDetails> {
  FichaOperations fichaOperations = FichaOperations();
  var exercises = [];

  void loadExercises() async {
    var _exercises =
        await fichaOperations.getExercisesFromFicha(widget.fichaId);
    setState(() {
      exercises = _exercises;
    });
    print(exercises);
  }

  @override
  void initState() {
    loadExercises();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Detalhes ' + widget.ficha.nome ?? 'Ficha'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add),
              tooltip: 'Adicionar Ficha',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddExercise()));
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              tooltip: 'Adicionar Ficha',
              onPressed: () async {
                await fichaOperations.deleteFicha(widget.fichaId);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
            ),
          ]),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16),
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
                              null);
                        },
                      ),
                    )
                  : const Text('Nenhum exerc??cio encontrado'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SelectExercise(widget.ficha, widget.fichaId)));
                  },
                  child: const Text('Adicionar Exerc??cio a Ficha'),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Home()));
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.home),
      ),
    );
  }
}
