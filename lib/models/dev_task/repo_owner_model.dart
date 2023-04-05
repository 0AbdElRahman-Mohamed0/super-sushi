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
    username = json['login'];
    id = json['id'];
    avatarUrl = json['avatar_url'];
    htmlUrl = json['html_url'];
  }
}
