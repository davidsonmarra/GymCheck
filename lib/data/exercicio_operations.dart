import 'package:gym_check/data/database.dart';
import 'package:gym_check/models/exercicio.dart';
import 'package:sqflite/sqflite.dart';

class ExercicioOperations {
  late DatabaseRepository db = DatabaseRepository.instance;

  createExercicio(Exercicio exrc) async {
    Database bd = await db.initDatabase();
    Map<String, dynamic> dadosUsuario = {
      "nome": exrc.nome,
      "num_series": exrc.numSeries,
      "num_repeticoes": exrc.numRepeticoes,
      "temp_exercicio": exrc.tempExercicio,
      "temp_descanso": exrc.tempDescanso,
    };

    int id = await bd.insert("Exer", dadosUsuario);
    print("Salvo: $id");
  }

  getAllExercises() async {
    Database bd = await db.initDatabase();
    String sql = "SELECT * FROM Exer";
    List exercicios = await bd.rawQuery(sql);
    return exercicios;
  }

  deleteExercise(id) async {
    Database bd = await db.initDatabase();
    String sql =
        "DELETE FROM Pertence WHERE fk_Exercicio_Id = " + id.toString();
    await bd.rawQuery(sql);
  }
}
