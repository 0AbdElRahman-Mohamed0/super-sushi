import 'dart:convert';

import 'package:super_sushi/models/dev_task/repo_owner_model.dart';
import 'package:super_sushi/services/db_services/sql_vars.dart';

/// Repo data
class RepoModel {
  /// ID of the repo
  int? id;

  /// Name of the repo
  String? name;

  /// Full name of the repo
  String? fullName;

  /// Owner of the repo
  RepoOwnerModel? owner;

  /// URL of the repo
  String? htmlUrl;

  /// Description of the repo
  String? description;

  /// Fork of the repo
  late bool fork;

  /// Get data from json api
  RepoModel.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fullName = json['full_name'];
    owner =
        json['owner'] != null ? RepoOwnerModel.fromMap(json['owner']) : null;
    htmlUrl = json['html_url'];
    description = json['description'];
    fork = json['fork'] ?? false;
  }

  /// Get data from json DB
  RepoModel.fromDB(Map<String, dynamic> m) {
    id = m[SQLRepoVars.columnId];
    name = m[SQLRepoVars.columnName];
    fullName = m[SQLRepoVars.columnFullName];
    owner = RepoOwnerModel.fromDB(
      json.decode(m[SQLRepoVars.columnOwner]),
    );
    htmlUrl = m[SQLRepoVars.columnHtmlUrl];
    description = m[SQLRepoVars.columnDescription];
    fork = m[SQLRepoVars.columnFork] == 1;
  }

  /// To send data to DB
  Map<String, Object?> toMap() {
    return {
      SQLRepoVars.columnId: id,
      SQLRepoVars.columnName: name,
      SQLRepoVars.columnFullName: fullName,
      SQLRepoVars.columnHtmlUrl: htmlUrl,
      SQLRepoVars.columnDescription: description,
      SQLRepoVars.columnFork: fork ? 1 : 0,
      SQLRepoVars.columnOwner: json.encode(owner?.toMap()),
    };
  }
}
