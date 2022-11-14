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
        String sql1 = 'CREATE TABLE Exer ('
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'nome VARCHAR,'
            'num_series INTEGER,'
            'num_repeticoes INTEGER,'
            'temp_exercicio INTEGER,'
            'temp_descanso INTEGER'
            ')';
        String sql2 = 'CREATE TABLE Ficha ('
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'nome VARCHAR,'
            'num_exercicios INTEGER,'
            'tempo_total INTEGER'
            ')';
        String sql3 = 'CREATE TABLE Pertence ('
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'fk_Exercicio_Id INTEGER,'
            'fk_Ficha_Id  INTEGER'
            ')';
        db.execute(sql1);
        db.execute(sql2);
        db.execute(sql3);
      },
    );
    print("Aberto: " + retorno.isOpen.toString());
    return retorno;
  }
}
