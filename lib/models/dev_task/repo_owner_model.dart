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

  /// Constructor
  RepoOwnerModel({
    this.username,
    this.id,
    this.avatarUrl,
    this.htmlUrl,
  });

  /// Get data from json
  RepoOwnerModel.fromMap(Map<String, dynamic> json) {
    username = json['login'] as String;
    id = json['id'] as int;
    avatarUrl = json['avatar_url'] as String;
    htmlUrl = json['html_url'] as String;
  }
}
