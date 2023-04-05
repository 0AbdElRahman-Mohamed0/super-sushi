import 'package:flutter/material.dart';
import 'package:super_sushi/models/dev_task/repo_model.dart';

export 'package:provider/provider.dart';

/// Repo provider to control state
class RepoProvider extends ChangeNotifier {
  /// Current repo
  RepoModel repo;

  /// Constructor to get current state repo
  RepoProvider(this.repo);
}
