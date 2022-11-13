import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DatabaseRepository {
  DatabaseRepository.privateConstructor();

  static final DatabaseRepository instance =
      DatabaseRepository.privateConstructor();

  initDatabase() async {
    final caminhoDB = await getDatabasesPath();
    final localDB = join(caminhoDB, 'gym_check.db');
    var retorno = await openDatabase(
      localDB,
      version: 1,
      onCreate: (db, dbVersaoRecente) {
        String sql = 'CREATE TABLE Exer ('
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'nome VARCHAR,'
            'num_series INTEGER,'
            'num_repeticoes INTEGER,'
            'temp_exercicio INTEGER,'
            'temp_descanso INTEGER'
            ')';
        db.execute(sql);
      },
    );
    print("Aberto: " + retorno.isOpen.toString());
    return retorno;
  }
}
