import 'package:flutter/material.dart';
import 'package:gym_check/models/ficha.dart';
import 'package:gym_check/screens/workout-details.dart';

class WorkoutListItem extends StatelessWidget {
  final int id;
  final String name;
  final int exercises;

  WorkoutListItem(
    this.id,
    this.name,
    this.exercises,
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: InkWell(
          child: SizedBox(
            width: 300,
            height: 100,
            child: Center(child: Text(name)),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        WorkoutDetails(Ficha(name, exercises), id)));
          },
        ),
      ),
    );
  }
}
