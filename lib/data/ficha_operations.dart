import 'package:gym_check/data/database.dart';
import 'package:gym_check/data/exercicio_operations.dart';
import 'package:gym_check/models/exercicio.dart';
import 'package:gym_check/models/ficha.dart';
import 'package:sqflite/sqflite.dart';

class FichaOperations {
  late DatabaseRepository db = DatabaseRepository.instance;

  createFicha(Ficha ficha) async {
    Database bd = await db.initDatabase();
    Map<String, dynamic> dadosFicha = {
      "nome": ficha.nome,
      "num_exercicios": ficha.num_exercicios,
    };

    int id = await bd.insert("Ficha", dadosFicha);
    print("Salvo: $id");
  }

  addFichaAndExercicio(int idFicha, int idExercicio) async {
    Database bd = await db.initDatabase();
    Map<String, dynamic> fichaAndExercicio = {
      "fk_Exercicio_Id": idExercicio,
      "fk_Ficha_Id": idFicha,
    };

    int id = await bd.insert("Pertence", fichaAndExercicio);
    print("Salvo: $id");
  }

  getExercisesFromFicha(int id) async {
    Database bd = await db.initDatabase();
    String sql = "SELECT * FROM Pertence WHERE fk_Ficha_Id = $id";
    List exerciciosId = await bd.rawQuery(sql);
    ExercicioOperations exOp = ExercicioOperations();
    var exercicios = await exOp.getAllExercises();
    print(exerciciosId);
    print(exercicios);
    var data = [];
    var list = exerciciosId.forEach((e) {
      exercicios.forEach((ex) {
        if (ex['id'] == e['fk_Exercicio_Id']) {
          data.add(ex);
        }
      });
    });
    return data;
  }

  getAllFichas() async {
    Database bd = await db.initDatabase();
    String sql = "SELECT * FROM Ficha";
    List exercicios = await bd.rawQuery(sql);
    return exercicios;
  }

  deleteFicha(id) async {
    Database bd = await db.initDatabase();
    String sql = "DELETE FROM Ficha WHERE id = " + id.toString();
    await bd.rawQuery(sql);
  }
}
