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
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.dstATop),
              image: NetworkImage(
                  "https://images.herzindagi.info/image/2021/Apr/workout-in-heat-s.jpg"),
              fit: BoxFit.cover),
        ),
        child: Card(
          color: Color.fromRGBO(0, 0, 0, 0),
          shadowColor: Color.fromRGBO(0, 0, 0, 0),
          child: InkWell(
            child: SizedBox(
              width: 300,
              height: 100,
              child: Center(
                  child: Text(
                exercicio.nome,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              )),
            ),
            onTap: () {
              functionOnTap != null
                  ? functionOnTap!(id)
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExerciseDetails(exercicio)));
              ;
            },
          ),
        ),
      ),
    );
  }
}
