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
    id = json['id'];
    name = json['name'];
    fullName = json['full_name'];
    owner =
        json['owner'] != null ? RepoOwnerModel.fromMap(json['owner']) : null;
    htmlUrl = json['html_url'];
    description = json['description'];
    fork = json['fork'];
  }
}
