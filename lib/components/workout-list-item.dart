import 'package:flutter/material.dart';
import 'package:gym_check/screens/workout-details.dart';

class WorkoutListItem extends StatelessWidget {
  final String name;
  final String description;
  final int exercises;

  WorkoutListItem(
    this.name,
    this.description,
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
                    builder: (context) => const WorkoutDetails()));
          },
        ),
      ),
    );
  }
}