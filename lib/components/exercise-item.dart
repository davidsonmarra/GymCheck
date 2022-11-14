import 'package:flutter/material.dart';
import 'package:gym_check/models/exercicio.dart';
import 'package:gym_check/screens/exercise-details.dart';

class ExerciseItem extends StatelessWidget {
  final int id;
  final Exercicio exercicio;
  final Function? functionOnTap;

  ExerciseItem(this.id, this.exercicio, this.functionOnTap);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: InkWell(
          child: SizedBox(
            width: 300,
            height: 100,
            child: Center(child: Text(exercicio.nome)),
          ),
          onTap: () {
            functionOnTap != null
                ? functionOnTap!(id)
                : Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ExerciseDetails()));
            ;
          },
        ),
      ),
    );
  }
}
