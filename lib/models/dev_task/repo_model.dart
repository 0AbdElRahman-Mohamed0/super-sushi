import 'package:super_sushi/models/dev_task/repo_owner_model.dart';

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
  bool? fork;

  /// Constructor
  RepoModel({
    this.id,
    this.name,
    this.fullName,
    this.owner,
    this.htmlUrl,
    this.description,
    this.fork,
  });

  /// Get data from json
  RepoModel.fromMap(Map<String, dynamic> json) {
    id = json['id'] as int;
    name = json['name'] as String;
    fullName = json['full_name'] as String;
    owner = json['owner'] != null
        ? RepoOwnerModel.fromMap(json['owner'] as Map<String, dynamic>)
        : null;
    htmlUrl = json['html_url'] as String;
    description = json['description'] as String;
    fork = json['fork'] as bool;
  }
}
