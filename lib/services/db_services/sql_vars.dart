class SQLRepoVars {
  static const String databaseName = 'LocalRepos.db';
  static const String tableName = 'repos';
  static const String columnId = '_id';
  static const String columnName = 'name';
  static const String columnFullName = 'full_name';
  static const String columnHtmlUrl = 'html_url';
  static const String columnDescription = 'description';
  static const String columnFork = 'fork';
  static const String columnOwner = 'owner';
}

class SQLOwnerVars {
  static const String columnId = 'id';
  static const String columnName = 'name';
  static const String columnAvatarUrl = 'avatar_url';
  static const String columnHtmlUrl = 'html_url';
}
