import 'package:flutter/material.dart';
import 'package:gym_check/components/exercise-item.dart';
import 'package:gym_check/components/workout-list-item.dart';
import 'package:gym_check/models/workout.dart';
import 'package:gym_check/screens/add-exercise.dart';
import 'package:gym_check/screens/qr-code-reader.dart';
import 'package:gym_check/screens/workout.dart';

class WorkoutDetails extends StatelessWidget {
  const WorkoutDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Workout Details'), actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.add),
          tooltip: 'Adicionar Ficha',
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddExercise()));
          },
        ),
      ]),
      body: Center(
        child: Column(
          children: [
            const Text('Workout Details'),
            ExerciseItem('Supino Reto', 'Treino de peito', 5),
            ExerciseItem('Leg Press', 'Treino de perna', 5),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Workout()));
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.timer),
      ),
    );
  }
}
