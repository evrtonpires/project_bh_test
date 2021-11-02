import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

/// [AppDatabase] é uma classe para persistência dos dados em um formato No-SQL
class AppDatabase {
  /// [database] obtem o acesso ao banco de dados.
  Future<Database> get database async {
    return _openDatabase();
  }

  /// Obtenha um diretório específico da plataforma onde os dados persistentes
  /// do aplicativo podem ser armazenados.
  Future<Database> _openDatabase() async {
    final db;

    final appDocumentDir = await getApplicationDocumentsDirectory();
    final Directory _appDocDirFolder =
        Directory('${appDocumentDir.path}/project_bh_test/Data/');

    if (await _appDocDirFolder.exists()) {
      final dbPath = join(_appDocDirFolder.path, 'project.db');

      db = await databaseFactoryIo.openDatabase(dbPath);
    } else {
      final Directory _appDocDirNewFolder =
          await _appDocDirFolder.create(recursive: true);
      final dbPath = join(_appDocDirNewFolder.path, 'project.db');

      db = await databaseFactoryIo.openDatabase(dbPath);
    }

    return db;
  }
}
