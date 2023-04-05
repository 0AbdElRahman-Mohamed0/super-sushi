import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:super_sushi/models/dev_task/repo_model.dart';
import 'package:super_sushi/services/db_services/sql_vars.dart';

export 'package:provider/provider.dart';

class DBHandler extends ChangeNotifier {
  Database? db;
  List<RepoModel>? repos;

  Future<void> initDB() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, SQLRepoVars.databaseName);

    if (!await Directory(databasesPath).exists()) {
      await Directory(databasesPath).create(recursive: true);
    }

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await Future.wait({
        db.execute('''
create table ${SQLRepoVars.tableName} ( 
  ${SQLRepoVars.columnId} integer primary key autoincrement, 
  ${SQLRepoVars.columnName} text not null,
  ${SQLRepoVars.columnFullName} text not null,
  ${SQLRepoVars.columnDescription} text not null,
  ${SQLRepoVars.columnHtmlUrl} text not null,
  ${SQLRepoVars.columnFork} integer not null,
  ${SQLRepoVars.columnOwner} text not null)
'''),
      });
    });
  }

  Future<void> getAllRepos() async {
    final List<Map<String, Object?>>? listRepos =
        await db?.query(SQLRepoVars.tableName);
    repos = [];
    for (final repo in listRepos ?? []) {
      repos?.add(RepoModel.fromDB(repo));
    }
    notifyListeners();
  }

  Future<void> batchRepos(List<RepoModel> reposData) async {
    final batch = db?.batch();
    for (final repo in reposData) {
      batch?.insert(
        SQLRepoVars.tableName,
        repo.toMap(),
      );
    }
    await batch?.commit();
  }

  Future<void> deleteDatabase() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, SQLRepoVars.databaseName);
    await databaseFactory.deleteDatabase(path);
  }

  Future closeDB() async => db?.close();
}
