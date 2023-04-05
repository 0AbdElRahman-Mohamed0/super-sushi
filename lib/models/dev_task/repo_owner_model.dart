import 'package:super_sushi/services/db_services/sql_vars.dart';

/// Owner of the repo data
class RepoOwnerModel {
  /// Username of the owner
  String? username;

  /// ID of the owner
  int? id;

  /// Image of the owner
  String? avatarUrl;

  /// URL of the owner
  String? htmlUrl;

  /// Get data from json api
  RepoOwnerModel.fromMap(Map<String, dynamic> json) {
    username = json['login'];
    id = json['id'];
    avatarUrl = json['avatar_url'];
    htmlUrl = json['html_url'];
  }

  /// Get data from json DB
  RepoOwnerModel.fromDB(Map<String, dynamic> json) {
    username = json[SQLOwnerVars.columnName];
    id = json[SQLOwnerVars.columnId];
    avatarUrl = json[SQLOwnerVars.columnAvatarUrl];
    htmlUrl = json[SQLOwnerVars.columnHtmlUrl];
  }

  /// To send data to DB
  Map<String, Object?> toMap() {
    return {
      SQLOwnerVars.columnId: id,
      SQLOwnerVars.columnName: username,
      SQLOwnerVars.columnAvatarUrl: avatarUrl,
      SQLOwnerVars.columnHtmlUrl: htmlUrl,
    };
  }
}
