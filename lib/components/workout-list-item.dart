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
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.dstATop),
              image: NetworkImage(
                  "https://img.freepik.com/premium-photo/3d-rendering-black-dumbbells-floor-dark-concept-fitness-room-with-training-equipments-back_67155-14961.jpg?w=2000"),
              fit: BoxFit.cover),
        ),
        child: Card(
          color: Color.fromRGBO(0, 0, 0, 0),
          shadowColor: Color.fromRGBO(0, 0, 0, 0),
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              width: 300,
              height: 100,
              child: Center(
                  child: Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              )),
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
      ),
    );
  }
}
